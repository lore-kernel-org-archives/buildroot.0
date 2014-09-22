From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon, 22 Sep 2014 14:19:03 -0400
Subject: [Buildroot] [PATCH 1/1] tiff: ensure directory exists before
 installing to it
In-Reply-To: <20140922192503.23ee2050@free-electrons.com>
References: <1410488467-2093-1-git-send-email-danomimanchego123@gmail.com>
 <20140922192503.23ee2050@free-electrons.com>
Message-ID: <CANxTyt7ZamM0EW7QsOOMQefeetFdhrWo-wjDnoD0TRZn7Tru+A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Mon, Sep 22, 2014 at 1:25 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Danomi Manchego,
>
> On Thu, 11 Sep 2014 22:21:07 -0400, Danomi Manchego wrote:
>> Also, don't ignore errors during installation.
>>
>> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
>> ---
>>  package/tiff/tiff.mk |    3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> Could you explain which configuration produced an issue solved by this
> patch? I tried a number of combinations (different toolchain
> configurations, without C++, etc.) and I did not managed to produce the
> issue.

I do not have a defconfig that demonstrates this.  I tend to encounter
these kind of error when I do the following trick to observe what
exactly is installed to the target directory:

    make tiff-rebuild TARGET_DIR=$(pwd)/TIFF
    tree TIFF

If I hit an error, they I figure that I'm just one mostly empty custom
skeleton and convoluted dependency graph away from hitting the error
in real life.  So then I submit a patch.

Danomi -
