From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Mar 2014 00:26:26 +0100
Subject: [Buildroot] Different site methods for the main package and
 patches
In-Reply-To: <87vbv0inub.fsf@dell.be.48ers.dk>
References: <CA+-urNQrPff3iTDGdWwYvbhLPXwCrqZgVA91qQS_RgM66VG1eQ@mail.gmail.com>
 <53331268.4030205@mind.be> <20140326233712.4347c3c8@skate>
 <87vbv0inub.fsf@dell.be.48ers.dk>
Message-ID: <20140327002626.0ec83331@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Wed, 26 Mar 2014 23:42:20 +0100, Peter Korsgaard wrote:

>  >  *) I don't really understand why we have a separation between _SITE
>  >     and _SOURCE, and why our infra assumes that _PATCH is relative to
>  >     _SITE. Why don't we simply make _SOURCE and _PATCH full URLs
>  >     instead? This way _PATCH can list multiple patches coming from
>  >     different locations, not necessarily the upstream location of the
>  >     package.
> 
> Some of it is historical, but it also makes it easier to support
> the primary/backup site features.

Even if:

BLEH_SOURCE = http://foobar.com/bleh-$(BLEH_VERSION).tar.gz

we can do:

	$(notdir $(BLEH_SOURCE))

to retrieve just the filename and look it up on the primary/backup
sites, no?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
