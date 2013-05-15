From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Wed, 15 May 2013 08:27:03 +0200
Subject: [Buildroot] [PATCH] Standardisation of $(BUILD)/.root name
In-Reply-To: <19013645.b0LZFaBj4B@sagittae>
References: <1368541851-31089-1-git-send-email-jezz@sysmic.org>
 <20130514222324.GA8043@free.fr> <19013645.b0LZFaBj4B@sagittae>
Message-ID: <25827956.EjHoov1O1Q@sagittae>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 15 May 2013 08:19:10 J?r?me Pouiller wrote:
> On Wednesday 15 May 2013 00:23:24 Yann E. MORIN wrote:
> [...]
> 
> > > I cannot just add a dependency between
> > > $(STAMP_DIR)/skeleton-target-installed and  $(STAMP_DIR).
> > 
> > Why not? Like:
> >     $(STAMP_DIR)/skeleton-target-installed: $(STAMP_DIR)
> > 
> > which to me looks like the sane solution (and not what I previosuly
> > answered Arnout about $(TARGET_DIR))
> 
> Because, $(STAMP_DIR)/skeleton-target-installed will be rebuilt each time a
> file is added or removed from $(STAMP_DIR).
But, we may use an intermediate phony target:
$(STAMP_DIR)_phony: $(STAMP_DIR)
.PHONY: $(STAMP_DIR)_phony
$(STAMP_DIR)/skeleton-target-installed: $(STAMP_DIR)_phony

(not tested, but should work)

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
