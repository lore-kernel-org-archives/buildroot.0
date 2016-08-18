From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 18 Aug 2016 21:53:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/simh: new package
In-Reply-To: <20160818212725.65c9b926@free-electrons.com>
References: <1471297357-11637-1-git-send-email-lothar.felten@gmail.com>
 <20160816035044.GB3368@tarshish>
 <9ba51c53-ddb3-8a59-a3b0-9ba8e3e52f3e@gmail.com>
 <20160816142950.GH3368@tarshish> <20160816194236.GC10734@free.fr>
 <20160818212725.65c9b926@free-electrons.com>
Message-ID: <20160818195351.GD5930@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Lothar, All,

On 2016-08-18 21:27 +0200, Thomas Petazzoni spake thusly:
> On Tue, 16 Aug 2016 21:42:36 +0200, Yann E. MORIN wrote:
> 
> > > I don't think so. Not sure how our legal info infra handles binary document 
> > > formats.  
> > 
> > FOO_LICENSE_FILES are just copied; we don't do anything with them. So
> > it's fine to list a .doc in there.
> 
> Not quite true: we generate a big .txt file with the concatenation of
> the license text of all packages, see licenses.txt and
> host-licenses.txt.

Indeed, I had forgotten about that...

Then, it that case, I think it would be better not to list the doc file
in SIMH_LICENSE_FILES at all.

Still, we'd want it to be copied, so maybe that could be done with a
post legal-info hook, something like (untested):

    define SIMH_LEGAL_INFO_DOC_FILE
        $(INSTALL) -m 0644 -D $(@D)/path/to/license.doc \
            $(LICENSE_FILES_DIR_TARGET)/simh-$(SIMH_VERSION)/license.doc
    endef
    SIMH_POST_LEGAL_INFO_HOOKS += SIMH_LEGAL_INFO_DOC_FILE

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
