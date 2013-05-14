From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 15 May 2013 00:23:24 +0200
Subject: [Buildroot] [PATCH] Standardisation of $(BUILD)/.root name
In-Reply-To: <2999958.1S5Q3eWKd9@sagittae>
References: <1368541851-31089-1-git-send-email-jezz@sysmic.org>
 <20130514170721.622fc086@skate> <2999958.1S5Q3eWKd9@sagittae>
Message-ID: <20130514222324.GA8043@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me, All,

On 2013-05-14 17:27 +0200, J?r?me Pouiller spake thusly:
> On Tuesday 14 May 2013 17:07:21 Thomas Petazzoni wrote:
> > Dear J?r?me Pouiller,
> > 
> > On Tue, 14 May 2013 16:30:50 +0200, J?r?me Pouiller wrote:
> > > -$(BUILD_DIR)/.root:
> > > 
> > > +$(STAMP_DIR)/skeleton-target-installed:
> > >  	mkdir -p $(TARGET_DIR)
> > >  	rsync -a \
> > >  	
> > >  		--exclude .empty --exclude .svn --exclude .git \
> > >  		--exclude .hg --exclude=CVS --exclude '*~' \
> > >  		$(TARGET_SKELETON)/ $(TARGET_DIR)/
> > >  	
> > >  	cp support/misc/target-dir-warning.txt $(TARGET_DIR_WARNING_FILE)
> > > 
> > > +	mkdir -p $(STAMP_DIR)
> > > 
> > >  	touch $@
> > 
> > I'm generally ok with the idea, but I don't like this mkdir. There is
> > already a mkdir that creates the stamp file directory, in the main
> > Makefile.
> I also dislike this mkdir. My problem is to be sure $(STAMP_DIR) is created 
> before $(STAMP_DIR)/skeleton-target-installed. 
> 
> I can change order of dependencies in dirs target but this solution is too 
> fragile.

Agreed, this is not-so-nice.

> I cannot just add a dependency between $(STAMP_DIR)/skeleton-target-installed 
> and  $(STAMP_DIR).

Why not? Like:
    $(STAMP_DIR)/skeleton-target-installed: $(STAMP_DIR)

which to me looks like the sane solution (and not what I previosuly
answered Arnout about $(TARGET_DIR))

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
