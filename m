From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 5 Feb 2017 21:37:47 +0100
Subject: [Buildroot] [PATCH 1/3] graph-depends: avoid use of global var
 'rule' in get_depends
In-Reply-To: <20170205152042.4c65c085@free-electrons.com>
References: <20170203205745.14488-1-patrickdepinguin@gmail.com>
 <20170203205745.14488-2-patrickdepinguin@gmail.com>
 <20170205152042.4c65c085@free-electrons.com>
Message-ID: <CAAXf6LVO+aBL8jb_GRpU4sTKYtwCikASS6Z-vwgbmV=mpi-QKw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Feb 5, 2017 at 3:20 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Fri,  3 Feb 2017 21:57:42 +0100, Thomas De Schampheleire wrote:
>> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>>
>> Function get_depends was recently changed to support both normal
>> dependencies as reverse dependencies, via a global variable 'rule' that
>> equals 'show-depends' or 'show-rdepends'.
>>
>> As a subsequent function will extract this function get_depends to a
>> separate file, the use of globals is problematic.
>>
>> Instead, pass the global as an argument.
>>
>> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>> ---
>>  support/scripts/graph-depends | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> Applied to master, thanks. We really need to clean up this script to
> move the "global" code into a main() function. Right now there is some
> global code intermixed with sub-functions, it's horrible.

Thanks.
Yes, I agree to move the global code into main. I didn't do it in this
series to not wander off too much of the real goal, but since you have
the same idea I can do it as a follow-up later.
