From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Sat, 27 Nov 2010 00:35:37 +0100
Subject: [Buildroot] handling package souce in .zip file
In-Reply-To: <AANLkTi==3zifJ5J6eToFRvVTTBvPh0zx2FW=qn_jrXrH@mail.gmail.com>
References: <AANLkTinM+8TXLvddMZopiOOV_i-GR2+-z-k8s_6WY_UJ@mail.gmail.com>
	<1290800123.14151.49.camel@coalu.atr>
	<AANLkTi==3zifJ5J6eToFRvVTTBvPh0zx2FW=qn_jrXrH@mail.gmail.com>
Message-ID: <1290814537.14151.55.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le samedi 27 novembre 2010 ? 01:05 +0200, Paulius Zaleckas a ?crit :
> On Fri, Nov 26, 2010 at 9:35 PM, Lionel Landwerlin
> <llandwerlin@gmail.com> wrote:
> > What's about this :
> >
> > unzip file.zip /tmp/plop
> > mv /tmp/plop/*/* output/build/myzippkg-0.1/
> 
> Yes, this is almost what I was thinking, but the problem is that there
> is no way to override "standard" buildroot extraction step or at least
> I don't know it (using GENTARGET) :)
> 

You just need to define a macro per ".ext", just like what we've got for
the download macros.

INFLATE.zip would be the 2 lines above, and for the rest it would be the
"bzcat/zcat/cat | tar -C ...".

Regards,

--
Lionel Landwerlin
