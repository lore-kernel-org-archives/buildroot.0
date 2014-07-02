From: Pascal Huerst <pascal.huerst@gmail.com>
Date: Wed, 02 Jul 2014 14:59:34 +0200
Subject: [Buildroot] [PATCH V5 1/2] google-breakpad: new package
In-Reply-To: <20140629123043.5bbe78c7@free-electrons.com>
References: <1403702174-23850-1-git-send-email-pascal.huerst@gmail.com>	<1403702174-23850-2-git-send-email-pascal.huerst@gmail.com>
 <20140629123043.5bbe78c7@free-electrons.com>
Message-ID: <53B40236.3010400@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Thomas, all

On 29.06.2014 12:30, Thomas Petazzoni wrote:
> On Wed, 25 Jun 2014 15:16:13 +0200, Pascal Huerst wrote:
>> Signed-off-by: Pascal Huerst <pascal.huerst@gmail.com>
>> ---
>>  package/Config.in                          |  1 +
>>  package/google-breakpad/Config.in          | 19 +++++++++++++++++++
>>  package/google-breakpad/google-breakpad.mk | 17 +++++++++++++++++
>>  3 files changed, 37 insertions(+)
>>  create mode 100644 package/google-breakpad/Config.in
>>  create mode 100644 package/google-breakpad/google-breakpad.mk
> 
> Thanks, I've applied your patch, after making some changes according to
> Arnout comments. From the commit log:
> 
>     [Thomas:
>      - Introduce a BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS Config.in
>        symbol to be able to easily propagate the architecture
>        dependencies.
>      - Wrap the help text, add some more details as suggested by Arnout.
>      - Propagate the architecture dependencies to the comment, as
>        suggested by Arnout.
>      - Remove the dependency of google-breakpad on host-google-breakpad,
>        since it's not needed.
>      - Add <pkg>_TARGET = NO, because google-breakpad only installs a
>        static library, so installation to staging is sufficient.
>      - Reorder autotools-package/host-autotools-package invocations, as
>        suggested by Arnout.]

Glad to hear that! And thank you for fixing up some Issues!

> Also, could you explain why you're passing --disable-processor when
> building the target package google-breakpad?

I made the assumption, that one will always do the debugging on the host
and that processor-tools such as minidump-stackwalk are not needed on
the target.

> For the second patch adding the core support for google-breakpad, there
> is still some on-going discussion, so I believe it's not ready to be
> applied yet.

Yes. I will have a look into that afterwards.

Thanks,
Pascal
