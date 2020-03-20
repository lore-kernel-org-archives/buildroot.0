From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 20 Mar 2020 22:10:26 +0100
Subject: [Buildroot] [PATCH 1/3] Makefile: don't hang the build if there
 are no file lists
In-Reply-To: <20200318214908.GB10025@scaer>
References: <20200318155814.567-1-patrickdepinguin@gmail.com>
 <20200318214908.GB10025@scaer>
Message-ID: <20200320221026.40dc06ab@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 18 Mar 2020 22:49:08 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> I would like to suggest an alternative, that guarantees the files are
> created, even if empty:
> 
>     $(if $(STAGING_DIR_FILES_LISTS), \
>         cat $(STAGING_DIR_FILES_LISTS)) >$(BUILD_DIR)/packages-file-list-staging.txt
> 
> Notice how the redirection is outside the conditional, so that if there
> is no file, the commadn will be:
> 
>     > $(BUILD_DIR)/packages-file-list-staging.txt  
> 
> Which will create an empty file.
> 
> Thoughts? Shall I do that when applying the series or will you want to
> respin?

What you suggest sounds good to me. Feel free to tweak that when
applying. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
