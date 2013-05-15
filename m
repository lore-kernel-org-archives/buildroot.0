From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Wed, 15 May 2013 08:19:10 +0200
Subject: [Buildroot] [PATCH] Standardisation of $(BUILD)/.root name
In-Reply-To: <20130514222324.GA8043@free.fr>
References: <1368541851-31089-1-git-send-email-jezz@sysmic.org>
 <2999958.1S5Q3eWKd9@sagittae> <20130514222324.GA8043@free.fr>
Message-ID: <19013645.b0LZFaBj4B@sagittae>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 15 May 2013 00:23:24 Yann E. MORIN wrote:
[...]
> > I cannot just add a dependency between
> > $(STAMP_DIR)/skeleton-target-installed and  $(STAMP_DIR).
> 
> Why not? Like:
>     $(STAMP_DIR)/skeleton-target-installed: $(STAMP_DIR)
> 
> which to me looks like the sane solution (and not what I previosuly
> answered Arnout about $(TARGET_DIR))
Because, $(STAMP_DIR)/skeleton-target-installed will be rebuilt each time a 
file is added or removed from $(STAMP_DIR).

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
