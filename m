From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 10 Jun 2019 11:19:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/cargo: needs host-libxml2
In-Reply-To: <9adf69a9-b764-d5c5-e484-958bb9f8548f@mind.be>
References: <20190609210835.31236-1-fontaine.fabrice@gmail.com>
 <9adf69a9-b764-d5c5-e484-958bb9f8548f@mind.be>
Message-ID: <20190610091913.GA23106@ned>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On 2019-06-10 01:07, Arnout Vandecappelle wrote:
>
>
> On 09/06/2019 23:08, Fabrice Fontaine wrote:
> > host-cargo needs host-libxml2 to avoid depending on an unworking
> > libxml2:
> >
> > --- stderr
> > cmake: /home/mark/buildroot-test/instance-1/output/host/lib/libcurl.so.4: no version information available (required by cmake)
> > cmake: symbol lookup error: /usr/lib/x86_64-linux-gnu/libxml2.so.2: undefined symbol: UCNV_TO_U_CALLBACK_STOP_60
> > thread 'main' panicked at '
> > command did not execute successfully, got: exit code: 127
>
>  I would like to understand this one a little more before blindly linking with
> host-libxml2...
>
>  I can't see anything in cargo's sources that refers to libxml2, except some of
> the vendored curl stuff, but those bits are only used on win32.

Same here. I tried to reproduce the issue in a chrooted Debian Stretch,
without success, even when adding libxml2-devel to the mix.

What is the configuration of the autobuilder?

Regards,

--
ELB
