From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 May 2016 22:49:20 +0200
Subject: [Buildroot] [PATCH v3 3/9] python: remove *.pyo files
In-Reply-To: <CAHXCMMKH31WxNPbP_5_TMwxTVa8ykKByvAuxn+5sdeCod_n56Q@mail.gmail.com>
References: <1462133720-409-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1462133720-409-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAHXCMMKH31WxNPbP_5_TMwxTVa8ykKByvAuxn+5sdeCod_n56Q@mail.gmail.com>
Message-ID: <20160517224920.39c7fff6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 1 May 2016 22:45:55 +0200, Samuel Martin wrote:

> > +# In all cases, we don't want to keep the optimized .pyo files
> > +ifeq ($(BR2_PACKAGE_PYTHON),y)
> > +define PYTHON_REMOVE_PYO_FILES
> > +       find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.pyo' -print0 | xargs -0 rm -f  
> I think xargs should be called with the --no-run-if-empty option.

Thanks for the hint, I've fixed this patch to add the
--no-run-if-empty. Other occurrences will have to be fixed separately.

Patch applied to next with your suggested change.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
