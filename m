From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:28:13 +0200
Subject: [Buildroot] [PATCH 031/100] git: use the new gettext logic
In-Reply-To: <89181a7b-28f3-13e2-d715-70e54eb59f4a@mind.be>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
 <20170704144920.12318-32-thomas.petazzoni@free-electrons.com>
 <89181a7b-28f3-13e2-d715-70e54eb59f4a@mind.be>
Message-ID: <20170705012813.399457c5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 4 Jul 2017 23:59:27 +0200, Arnout Vandecappelle wrote:

> > -GIT_DEPENDENCIES = zlib host-gettext  
> 
>  You dropped the host-gettext dependency, was that intentional?

Yes: when NLS support is disabled, host-gettext is not needed. When NLS
support is enabled, host-gettext is brought in by
TARGET_NLS_DEPENDENCIES in:

> > +GIT_DEPENDENCIES = zlib $(TARGET_NLS_DEPENDENCIES)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
