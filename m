From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Sat, 13 Feb 2010 17:52:08 +0100
Subject: [Buildroot] [PATCH 1/3] gtk-doc: add gtk-doc.m4 to satisfy
 aclocal
In-Reply-To: <61f677cb060732316b41f072210986e97ae9379f.1266074036.git.thomas.petazzoni@free-electrons.com>
References: <cover.1266074036.git.thomas.petazzoni@free-electrons.com>
	<61f677cb060732316b41f072210986e97ae9379f.1266074036.git.thomas.petazzoni@free-electrons.com>
Message-ID: <1266079928.2185.18.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le samedi 13 f?vrier 2010 ? 16:13 +0100, Thomas Petazzoni a ?crit :
> When packages using gtk-doc are autoreconfigured, aclocal complains
> because it cannot find the macros defined in gtk-doc.m4. We could
> compile the gtk-doc package for the host, but it depends on
> gnome-doc-utils, which depends on libxml2, libxslt, and other packages
> as well.
> 
> Since we don't care about the documentation, all is needed is in fact
> the gtk-doc.m4, so that the configure script can be generated, and we
> can use the --disable-gtk-doc to not generate the documentation.
> 
> To solve this, we include a gtk-doc.m4 file in package/automake/, and
> it gets installed in $(STAGING_DIR)/usr/share/aclocal/ during the
> installation of the host automake (used for autoreconfiguration of
> packages).
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Lionel Landwerlin <llandwerlin@gmail.com>
