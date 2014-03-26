From: rjbarnet at rockwellcollins.com <rjbarnet@rockwellcollins.com>
Date: Wed, 26 Mar 2014 18:00:36 -0500
Subject: [Buildroot] Different site methods for the main package
	and	patches
In-Reply-To: <87vbv0inub.fsf@dell.be.48ers.dk>
References: <CA+-urNQrPff3iTDGdWwYvbhLPXwCrqZgVA91qQS_RgM66VG1eQ@mail.gmail.com>
 <53331268.4030205@mind.be> <20140326233712.4347c3c8@skate>
 <87vbv0inub.fsf@dell.be.48ers.dk>
Message-ID: <OF16F36CD0.F255A517-ON86257CA7.007D5FE1-86257CA7.007E5F73@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter/Thomas/Yann,

Peter Korsgaard <jacmet@uclibc.org> wrote on 03/26/2014 05:42:20 PM:

> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 
writes:
> 
> Hi,
> 
>  > Generally speaking, I'm a bit unhappy about how things work on the
>  > download front:
> 
>  >  *) I don't really understand why we have a separation between _SITE
>  >     and _SOURCE, and why our infra assumes that _PATCH is relative to
>  >     _SITE. Why don't we simply make _SOURCE and _PATCH full URLs
>  >     instead? This way _PATCH can list multiple patches coming from
>  >     different locations, not necessarily the upstream location of the
>  >     package.
> 
> Some of it is historical, but it also makes it easier to support
> the primary/backup site features.

The primary/backup site feature is useful when using Buildroot on build 
machines behind a firewall. You are able to create and host a local mirror 
of http://sources.buildroot.net/ which makes managing firewall rules much 
easier. Any modification to the download infrastructure would need to 
support this feature (preferably by still defining BR2_PRIMARY_SITE).

Thanks,
-Ryan
