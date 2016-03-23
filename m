From: Matthew Weber <matt@thewebers.ws>
Date: Wed, 23 Mar 2016 16:31:13 -0500
Subject: [Buildroot] [PATCH 1/1] setools: disable arch sparc64
In-Reply-To: <20160323130907.3c2c28ff@free-electrons.com>
References: <1458698562-11227-1-git-send-email-matt@thewebers.ws>
 <20160323130907.3c2c28ff@free-electrons.com>
Message-ID: <CAFt09wP3f3xJWf96Av=gs6yTQ2NCim+OfsvcR8W3ojvrzKLvbw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Wed, Mar 23, 2016 at 7:09 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Tue, 22 Mar 2016 21:02:42 -0500, Matt Weber wrote:
>> Currently the buildroot sparc64 toolchain encounters a series of relocation
>> errors.  i.e.
>> policy_scan.c: relocation truncated to fit: R_SPARC_GOT13 against symbol ....
>>
>> Workaround for numerous autobuilder failures, including:
>> http://autobuild.buildroot.net/results/ba1/ba1e473178bb66ebc43897b20e534606d2577ee3/
>>
>> Signed-off-by: Matt Weber <matt@thewebers.ws>
>> ---
>>  package/setools/Config.in | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> IMO, it can be made to work quite easily on sparc64, it's just a matter
> of using -fPIE to build, and not -fpie.
>

Good to know.  I'll reject this patch and do some further testing.

-- 
Thanks,
Matt
