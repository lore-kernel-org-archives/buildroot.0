From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Aug 2020 21:59:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/bellagio: fix build with gcc 10
In-Reply-To: <20200812202508.2874057-1-fontaine.fabrice@gmail.com>
References: <20200812202508.2874057-1-fontaine.fabrice@gmail.com>
Message-ID: <20200813215922.154cf34b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 12 Aug 2020 22:25:08 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> +diff --git a/src/omx_reference_resource_manager.c b/src/omx_reference_resource_manager.c
> +index ee7766b..5983611 100644
> +--- a/src/omx_reference_resource_manager.c
> ++++ b/src/omx_reference_resource_manager.c
> +@@ -30,6 +30,11 @@
> + #include "base/omx_base_component.h"
> + #include "queue.h"
> + 
> ++int globalIndex;
> ++NameIndexType *listOfcomponentRegistered;
> ++ComponentListType **globalComponentList;
> ++ComponentListType **globalWaitingComponentList;

If these symbols are really only used in this file, then they should
preferably be declared with the static qualifier.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
