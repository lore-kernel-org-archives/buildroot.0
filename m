From: Luca Ceresoli <list@lucaceresoli.net>
Date: Fri, 14 Jan 2011 17:48:45 +0100
Subject: [Buildroot]
	=?utf-8?q?=5BPATCH_1/2=5D_liberation=3A_add_support_f?=
	=?utf-8?q?or_custom_target_directory?=
In-Reply-To: <20110114094756.4f6d1747@surf>
References: =?iso-8859-1?q?=3CLEWX59=244533F784E6DAC4CB1531E0AED3C460A7=40aruba?=
	=?iso-8859-1?q?=2Eit=3E_=3C20110114094756=2E4f6d1747=40surf=3E?=
Message-ID: <LF0UP9$6C050B5F0CF790CC5FFC45AB98AF886D@aruba.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 12 Jan 2011 14:51:09 +0100
> "Luca Ceresoli" <list@lucaceresoli.net> wrote:
> 
> > I think Thomas is right: a unique setting should be used to override
> > the font install dir.
> > 
> > It might look like this in menuconfig:
> > 
> >       *** X libraries and helper libraries ***
> >   ()  Force all fonts to be installed here {*}
> >   [*] DejaVu (Free fonts)  --->
> >   [ ] Liberation (Free fonts) 
> >       *** X Window managers ***
> > 
> > {*} if this is empty, each font .mk will install in the default directory,
> > as liberation does in current head;
> > otherwise all fonts will be copied in the directory specified.
> > 
> > How about this?
> 
> That could be one solution. The other solution would be to hide this
> from the user, i.e an unvisible configuration option to select the
> installation location of the fonts (i.e ? fonts in subdirs ? or ? all
> fonts in /usr/share/fonts ?). ? fonts in subdirs ? would be the
> default, and ? all fonts in /usr/share/fonts/ ? would be selected by
> Nano-X/Microwindows. This way, the user wouldn't have to worry about
> the installation location of fonts.

That would not be enough in my case.
I don't use Nano-x/Microwin, my setup is based on qt + directfb + freetype.
I am not sure which of these components needs fonts in a specific dir,
but if fonts are in subdirs they won't be found.

Luca
