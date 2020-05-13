From: Patrick Mochel <patrick.mochel@timesys.com>
Date: Wed, 13 May 2020 14:46:04 -0700
Subject: [Buildroot] Adding post image hook
In-Reply-To: <20200513212952.GD12536@scaer>
References: <20200511175027.71ed1d22@windsurf.home>
 <ea-mime-5ebc52f4-7a9b-60b07d84@www-1.mailo.com>
 <20200513221628.42c07184@windsurf.home>
 <CAFV4z9Y6QvY=Ds2sw6U27fSnrcVeKJ0a9p8-nZhHZS+Mua3fEQ@mail.gmail.com>
 <20200513212952.GD12536@scaer>
Message-ID: <CAFV4z9bmpryMth8sY0rCFN_4tV_+xpU7xA_g8_E5Ke8FUxSGVA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Wed, May 13, 2020 at 2:30 PM Yann E. MORIN <yann.morin.1998@free.fr>
wrote:


> > FWIW, This doesn't generate any output.
>
> Probably you were doing an out-of-tree build?
>

Nope, it's an in-tree build, configured and already built. And it's this
recent:

 $ git describe
2020.02-1207-ga8da12f0f9


...

> > .. which does generate +/- the desired output of _everything_, but it
> also results in this in the shell:
> >   make: support/dependencies/check-host-.sh: Command not found
>
> Yes, this is a side-effect of not actually runing the commands: some
>
...

ACK -- not a personal concern; just a minor wart.

...

> Nowadays, the cannonical way to extract information out of the internals
> of Buildroot is geared toward json-formatted output.
>
> If you want information from packages, you should use (and extend if
> needed) from your post-scripts:
>
>     make --no-print-directory -C $(BASE_DIR) show-info
>

That's a good point and I shall look into it again as to whether that'll
provide all the metadata that we need, since we need the similar concerning
the firmware and kernel components, which are classified differently than
the packages.

If you're curious, here's the current (fresh!) code:

https://github.com/TimesysGit/vigiles-buildroot

I apologize for the shameless promotion of a semi-commercial product. And,
I must say it ain't my best work. That said, the point of it is to gather
specific metadata about the various components of an built system, generate
a json manifest and submit for a CVE check of known vulnerabilities (that's
our money-maker). YMMV.

Thanks for the reply.

Cheers,


Patrick
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200513/4506c349/attachment.html>
