Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A9EC433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 16:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 540B5400FC;
	Thu, 30 Dec 2021 16:01:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SxpOrimuMhmG; Thu, 30 Dec 2021 16:01:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7F0440156;
	Thu, 30 Dec 2021 16:01:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 167BD1BF403
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 16:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05C56606F5
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 16:01:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U5HyWFyiDISC for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 16:01:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C3BD60590
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 16:01:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6BE2982DE2; Thu, 30 Dec 2021 15:55:08 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 16:59:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 97c90696d96c75c242337e5eb27685f8fe93248f
X-Git-Newrev: cf13b5b301536ee1edb6ed2710affb3c2afa1460
X-Patchwork-Hint: ignore
Message-Id: <20211230155508.6BE2982DE2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-mediadriver: bump version to
 22.1.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cf13b5b301536ee1edb6ed2710affb3c2afa1460
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch 0002 which was applied upstream:
https://github.com/intel/media-driver/commit/42ffd7983a32b75cf8403c235d8d0f727191390c

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-GMM-Multi-Adapter-Interface-Changes.patch | 500 ---------------------
 package/intel-mediadriver/intel-mediadriver.hash   |   2 +-
 package/intel-mediadriver/intel-mediadriver.mk     |   2 +-
 3 files changed, 2 insertions(+), 502 deletions(-)

diff --git a/package/intel-mediadriver/0002-GMM-Multi-Adapter-Interface-Changes.patch b/package/intel-mediadriver/0002-GMM-Multi-Adapter-Interface-Changes.patch
deleted file mode 100644
index 6544724a20..0000000000
--- a/package/intel-mediadriver/0002-GMM-Multi-Adapter-Interface-Changes.patch
+++ /dev/null
@@ -1,500 +0,0 @@
-From 42ffd7983a32b75cf8403c235d8d0f727191390c Mon Sep 17 00:00:00 2001
-From: kankanzh <kankan.zheng@intel.com>
-Date: Mon, 29 Nov 2021 14:16:42 +0800
-Subject: [PATCH] [Media Common] GMM Multi-Adapter Interface Changes
-
-* [Media Common] GMM Multi-Adapter Interface Changes
-
-Gmm change interface to support Multi-Adapter, media UMD need change the corresponding interface.
-
-Downloaded from upstream commit
-https://github.com/intel/media-driver/commit/42ffd7983a32b75cf8403c235d8d0f727191390c
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- .../linux/common/os/media_skuwa_specific.h    |  1 +
- .../linux/common/os/mos_os_specific.h         |  1 -
- media_driver/linux/common/ddi/media_libva.cpp | 70 +++++++++++--------
- .../linux/common/ddi/media_libva_common.h     |  2 -
- .../linux/common/os/linux_shadow_skuwa.h      |  1 +
- .../linux/common/os/mos_auxtable_mgr.cpp      | 21 ++----
- .../linux/common/os/mos_auxtable_mgr.h        |  4 +-
- .../linux/common/os/mos_interface.cpp         | 31 +++++---
- .../linux/common/os/mos_os_specific.c         | 14 +---
- media_driver/media_top_cmake.cmake            |  2 +-
- .../agnostic/common/os/mos_interface.h        | 16 +++++
- .../common/os/mos_context_specific_next.cpp   | 59 ++++++++--------
- 12 files changed, 118 insertions(+), 104 deletions(-)
-
-diff --git a/media_common/linux/common/os/media_skuwa_specific.h b/media_common/linux/common/os/media_skuwa_specific.h
-index 7f8f4fe317..7c046bc44c 100644
---- a/media_common/linux/common/os/media_skuwa_specific.h
-+++ b/media_common/linux/common/os/media_skuwa_specific.h
-@@ -40,5 +40,6 @@ using MEDIA_ENGINE_INFO   = MEDIA_GT_SYSTEM_INFO;
- using GMM_SKU_FEATURE_TABLE   = SHADOW_MEDIA_FEATURE_TABLE;
- using GMM_WA_TABLE            = SHADOW_MEDIA_WA_TABLE;
- using GMM_GT_SYSTEM_INFO      = MEDIA_GT_SYSTEM_INFO;
-+using GMM_ADAPTER_BDF         = MEDIA_ADAPTER_BDF;
- 
- #endif // __MEDIA_SKUWA_H__
-diff --git a/media_common/linux/common/os/mos_os_specific.h b/media_common/linux/common/os/mos_os_specific.h
-index 3c33196447..ce881c0912 100644
---- a/media_common/linux/common/os/mos_os_specific.h
-+++ b/media_common/linux/common/os/mos_os_specific.h
-@@ -582,7 +582,6 @@ struct _MOS_OS_CONTEXT
-     void                *pLibdrmHandle;
- 
-     GMM_CLIENT_CONTEXT  *pGmmClientContext;   //UMD specific ClientContext object in GMM
--    GmmExportEntries    GmmFuncs;
-     AuxTableMgr         *m_auxTableMgr;
-    
-     // GPU Status Buffer
-diff --git a/media_driver/linux/common/ddi/media_libva.cpp b/media_driver/linux/common/ddi/media_libva.cpp
-index 36f5f1889d..6202af5f2d 100755
---- a/media_driver/linux/common/ddi/media_libva.cpp
-+++ b/media_driver/linux/common/ddi/media_libva.cpp
-@@ -1857,6 +1857,9 @@ VAStatus DdiMedia_InitMediaContext (
-         GMM_GT_SYSTEM_INFO gmmGtInfo;
-         memset(&gmmGtInfo, 0, sizeof(gmmGtInfo));
- 
-+        GMM_ADAPTER_BDF gmmAdapterBDF;
-+        memset(&gmmAdapterBDF, 0, sizeof(gmmAdapterBDF));
-+
-         eStatus = HWInfo_GetGmmInfo(mediaCtx->fd, &gmmSkuTable, &gmmWaTable, &gmmGtInfo);
-         if (MOS_STATUS_SUCCESS != eStatus)
-         {
-@@ -1881,32 +1884,50 @@ VAStatus DdiMedia_InitMediaContext (
-             return VA_STATUS_ERROR_OPERATION_FAILED;
-         }
- 
--        GMM_STATUS gmmStatus = OpenGmm(&mediaCtx->GmmFuncs);
--        if (gmmStatus != GMM_SUCCESS)
-+        // fill in the mos context struct as input to initialize m_osContext
-+        MOS_CONTEXT mosCtx           = {};
-+        mosCtx.bufmgr                = mediaCtx->pDrmBufMgr;
-+        mosCtx.fd                    = mediaCtx->fd;
-+        mosCtx.iDeviceId             = mediaCtx->iDeviceId;
-+        mosCtx.SkuTable              = mediaCtx->SkuTable;
-+        mosCtx.WaTable               = mediaCtx->WaTable;
-+        mosCtx.gtSystemInfo          = *mediaCtx->pGtSystemInfo;
-+        mosCtx.platform              = mediaCtx->platform;
-+        mosCtx.ppMediaMemDecompState = &mediaCtx->pMediaMemDecompState;
-+        mosCtx.pfnMemoryDecompress   = mediaCtx->pfnMemoryDecompress;
-+        mosCtx.pfnMediaMemoryCopy    = mediaCtx->pfnMediaMemoryCopy;
-+        mosCtx.pfnMediaMemoryCopy2D  = mediaCtx->pfnMediaMemoryCopy2D;
-+        mosCtx.ppMediaCopyState      = &mediaCtx->pMediaCopyState;
-+
-+        eStatus = MosInterface::GetAdapterBDF(&mosCtx, &gmmAdapterBDF);
-+        if (MOS_STATUS_SUCCESS != eStatus)
-         {
--            DDI_ASSERTMESSAGE("gmm init failed.");
-+            DDI_ASSERTMESSAGE("Fatal error - unsuccesfull Gmm Adapter BDF initialization");
-             FreeForMediaContext(mediaCtx);
-             return VA_STATUS_ERROR_OPERATION_FAILED;
-         }
- 
--        // init GMM context
--        gmmStatus = mediaCtx->GmmFuncs.pfnCreateSingletonContext(mediaCtx->platform,
--            &gmmSkuTable,
--            &gmmWaTable,
--            &gmmGtInfo);
--
--        if (gmmStatus != GMM_SUCCESS)
-+        // Initialize Gmm context
-+        GMM_INIT_IN_ARGS  gmmInitAgrs = {};
-+        GMM_INIT_OUT_ARGS gmmOutArgs  = {};
-+        gmmInitAgrs.Platform          = mediaCtx->platform;
-+        gmmInitAgrs.pSkuTable         = &gmmSkuTable;
-+        gmmInitAgrs.pWaTable          = &gmmWaTable;
-+        gmmInitAgrs.pGtSysInfo        = &gmmGtInfo;
-+        gmmInitAgrs.FileDescriptor    = gmmAdapterBDF.Data;
-+        gmmInitAgrs.ClientType        = (GMM_CLIENT)GMM_LIBVA_LINUX;
-+
-+        GMM_STATUS status = InitializeGmm(&gmmInitAgrs, &gmmOutArgs);
-+        if (status != GMM_SUCCESS)
-         {
--            DDI_ASSERTMESSAGE("gmm init failed.");
-+            DDI_ASSERTMESSAGE("InitializeGmm fail.");
-             FreeForMediaContext(mediaCtx);
-             return VA_STATUS_ERROR_OPERATION_FAILED;
-         }
--
--        // Create GMM Client Context
--        mediaCtx->pGmmClientContext = mediaCtx->GmmFuncs.pfnCreateClientContext((GMM_CLIENT)GMM_LIBVA_LINUX);
-+        mediaCtx->pGmmClientContext = gmmOutArgs.pGmmClientContext;
- 
-         // Create GMM page table manager
--        mediaCtx->m_auxTableMgr = AuxTableMgr::CreateAuxTableMgr(mediaCtx->pDrmBufMgr, &mediaCtx->SkuTable);
-+        mediaCtx->m_auxTableMgr = AuxTableMgr::CreateAuxTableMgr(mediaCtx->pDrmBufMgr, &mediaCtx->SkuTable, mediaCtx->pGmmClientContext);
- 
-         MOS_USER_FEATURE_VALUE_DATA UserFeatureData;
-         MOS_ZeroMemory(&UserFeatureData, sizeof(UserFeatureData));
-@@ -1929,19 +1950,6 @@ VAStatus DdiMedia_InitMediaContext (
-             return VA_STATUS_ERROR_OPERATION_FAILED;
-         }
- 
--        // fill in the mos context struct as input to initialize m_osContext
--        mosCtx.bufmgr                = mediaCtx->pDrmBufMgr;
--        mosCtx.fd                    = mediaCtx->fd;
--        mosCtx.iDeviceId             = mediaCtx->iDeviceId;
--        mosCtx.SkuTable              = mediaCtx->SkuTable;
--        mosCtx.WaTable               = mediaCtx->WaTable;
--        mosCtx.gtSystemInfo          = *mediaCtx->pGtSystemInfo;
--        mosCtx.platform              = mediaCtx->platform;
--        mosCtx.ppMediaMemDecompState = &mediaCtx->pMediaMemDecompState;
--        mosCtx.pfnMemoryDecompress   = mediaCtx->pfnMemoryDecompress;
--        mosCtx.pfnMediaMemoryCopy    = mediaCtx->pfnMediaMemoryCopy;
--        mosCtx.pfnMediaMemoryCopy2D  = mediaCtx->pfnMediaMemoryCopy2D;
--        mosCtx.ppMediaCopyState      = &mediaCtx->pMediaCopyState;
-         mosCtx.m_auxTableMgr         = mediaCtx->m_auxTableMgr;
-         mosCtx.pGmmClientContext     = mediaCtx->pGmmClientContext;
- 
-@@ -2262,8 +2270,10 @@ VAStatus DdiMedia_Terminate (
-         // Destroy memory allocated to store Media System Info
-         MOS_FreeMemory(mediaCtx->pGtSystemInfo);
-         // Free GMM memory.
--        mediaCtx->GmmFuncs.pfnDeleteClientContext(mediaCtx->pGmmClientContext);
--        mediaCtx->GmmFuncs.pfnDestroySingletonContext();
-+        GMM_INIT_OUT_ARGS gmmOutArgs = {};
-+        gmmOutArgs.pGmmClientContext = mediaCtx->pGmmClientContext;
-+        GmmAdapterDestroy(&gmmOutArgs);
-+        mediaCtx->pGmmClientContext = nullptr;
-         MosUtilities::MosUtilitiesClose(nullptr);
-     }
- 
-diff --git a/media_driver/linux/common/ddi/media_libva_common.h b/media_driver/linux/common/ddi/media_libva_common.h
-index e967d49f5a..74ce820346 100644
---- a/media_driver/linux/common/ddi/media_libva_common.h
-+++ b/media_driver/linux/common/ddi/media_libva_common.h
-@@ -536,8 +536,6 @@ struct DDI_MEDIA_CONTEXT
- 
-     GMM_CLIENT_CONTEXT  *pGmmClientContext;
- 
--    GmmExportEntries   GmmFuncs;
--
-     // Aux Table Manager
-     AuxTableMgr         *m_auxTableMgr;
- 
-diff --git a/media_driver/linux/common/os/linux_shadow_skuwa.h b/media_driver/linux/common/os/linux_shadow_skuwa.h
-index 529fa05a1b..30321c9563 100644
---- a/media_driver/linux/common/os/linux_shadow_skuwa.h
-+++ b/media_driver/linux/common/os/linux_shadow_skuwa.h
-@@ -33,5 +33,6 @@
- using SHADOW_MEDIA_FEATURE_TABLE = SKU_FEATURE_TABLE;
- using SHADOW_MEDIA_WA_TABLE      = WA_TABLE;
- using MEDIA_GT_SYSTEM_INFO       = GT_SYSTEM_INFO;
-+using MEDIA_ADAPTER_BDF          = ADAPTER_BDF;
- 
- #endif //__SKU_WA_H__
-diff --git a/media_driver/linux/common/os/mos_auxtable_mgr.cpp b/media_driver/linux/common/os/mos_auxtable_mgr.cpp
-index fdab2b4c07..292dde020a 100644
---- a/media_driver/linux/common/os/mos_auxtable_mgr.cpp
-+++ b/media_driver/linux/common/os/mos_auxtable_mgr.cpp
-@@ -118,19 +118,13 @@ static void WaitFromCpuCb(void *bo)
-     }
- }
- 
--AuxTableMgr::AuxTableMgr(MOS_BUFMGR *bufMgr)
-+AuxTableMgr::AuxTableMgr(MOS_BUFMGR *bufMgr, GMM_CLIENT_CONTEXT *gmmClientContext)
- {
-     if (bufMgr)
-     {
-         GMM_DEVICE_CALLBACKS_INT deviceCb = {0};
- 
--        GmmExportEntries GmmFuncs;
--        GMM_STATUS gmmStatus = OpenGmm(&GmmFuncs);
--        if(gmmStatus != GMM_SUCCESS)
--        {
--            MOS_OS_ASSERTMESSAGE("gmm init failed.");
--        }
--        m_gmmClientContext = GmmFuncs.pfnCreateClientContext((GMM_CLIENT)GMM_LIBVA_LINUX);
-+        m_gmmClientContext = gmmClientContext;
-         if (m_gmmClientContext == nullptr)
-         {
-             MOS_OS_ASSERTMESSAGE(" nullptr returned by GmmCreateClientContext");
-@@ -160,22 +154,15 @@ AuxTableMgr::~AuxTableMgr()
-     }
-     if (m_gmmClientContext != nullptr)
-     {
--        GmmExportEntries GmmFuncs;
--        GMM_STATUS gmmStatus = OpenGmm(&GmmFuncs);
--        if(gmmStatus != GMM_SUCCESS)
--        {
--            MOS_OS_ASSERTMESSAGE("gmm init failed.");
--        }
--        GmmFuncs.pfnDeleteClientContext((GMM_CLIENT_CONTEXT *)m_gmmClientContext);
-         m_gmmClientContext = nullptr;
-     }
- }
- 
--AuxTableMgr * AuxTableMgr::CreateAuxTableMgr(MOS_BUFMGR *bufMgr, MEDIA_FEATURE_TABLE *sku)
-+AuxTableMgr * AuxTableMgr::CreateAuxTableMgr(MOS_BUFMGR *bufMgr, MEDIA_FEATURE_TABLE *sku, GMM_CLIENT_CONTEXT *gmmClientContext)
- {
-     if (MEDIA_IS_SKU(sku, FtrE2ECompression) && !MEDIA_IS_SKU(sku, FtrFlatPhysCCS))
-     {
--        AuxTableMgr *auxTableMgr = MOS_New(AuxTableMgr, bufMgr);
-+        AuxTableMgr *auxTableMgr = MOS_New(AuxTableMgr, bufMgr, gmmClientContext);
-         if (auxTableMgr == nullptr)
-         {
-             MOS_OS_ASSERTMESSAGE(" nullptr returned by creating AuxTableMgr");
-diff --git a/media_driver/linux/common/os/mos_auxtable_mgr.h b/media_driver/linux/common/os/mos_auxtable_mgr.h
-index 8fbf59da91..421d2293d6 100644
---- a/media_driver/linux/common/os/mos_auxtable_mgr.h
-+++ b/media_driver/linux/common/os/mos_auxtable_mgr.h
-@@ -43,7 +43,7 @@ class AuxTableMgr
-     //!
-     //! \brief  Constructor
-     //!
--    AuxTableMgr(MOS_BUFMGR *bufMgr);
-+    AuxTableMgr(MOS_BUFMGR *bufMgr, GMM_CLIENT_CONTEXT *gmmClientContext);
- 
-     //!
-     //! \brief  Destructor
-@@ -62,7 +62,7 @@ class AuxTableMgr
-     //! \return   Object pointer to AuxTableMgr
-     //!           Return object pointer if success or return nullptr if failed
-     //!
--    static AuxTableMgr * CreateAuxTableMgr(MOS_BUFMGR *bufMgr, MEDIA_FEATURE_TABLE *sku);
-+    static AuxTableMgr * CreateAuxTableMgr(MOS_BUFMGR *bufMgr, MEDIA_FEATURE_TABLE *sku, GMM_CLIENT_CONTEXT *gmmClientContext);
- 
-     //!
-     //! \brief    Map resource to aux table
-diff --git a/media_driver/linux/common/os/mos_interface.cpp b/media_driver/linux/common/os/mos_interface.cpp
-index 3b841bd586..caf4916ba9 100644
---- a/media_driver/linux/common/os/mos_interface.cpp
-+++ b/media_driver/linux/common/os/mos_interface.cpp
-@@ -367,17 +367,9 @@ MOS_STATUS MosInterface::InitStreamParameters(
-     context->m_osDeviceContext  = streamState->osDeviceContext;
-     context->bSimIsActive       = streamState->simIsActive;
- 
--    if (GMM_SUCCESS != OpenGmm(&context->GmmFuncs))
--    {
--        MOS_FreeMemAndSetNull(context);
--
--        MOS_OS_ASSERTMESSAGE("Unable to open gmm");
--        return MOS_STATUS_INVALID_PARAMETER;
--    }
--
-     streamState->perStreamParameters = (OS_PER_STREAM_PARAMETERS)context;
- 
--    context->pGmmClientContext  = context->GmmFuncs.pfnCreateClientContext((GMM_CLIENT)GMM_LIBVA_LINUX);
-+    context->pGmmClientContext  = streamState->osDeviceContext->GetGmmClientContext();;
- 
-     context->bufmgr             = bufMgr;
-     context->m_gpuContextMgr    = osDeviceContext->GetGpuContextMgr();
-@@ -608,6 +600,27 @@ MOS_STATUS MosInterface::CreateGpuContext(
-     return MOS_STATUS_SUCCESS;
- }
- 
-+MOS_STATUS MosInterface::GetAdapterBDF(PMOS_CONTEXT mosCtx, ADAPTER_BDF *adapterBDF)
-+{
-+    MOS_OS_FUNCTION_ENTER;
-+
-+    drmDevicePtr device;
-+    
-+    MOS_OS_CHK_NULL_RETURN(mosCtx);
-+    if (drmGetDevice(mosCtx->fd, &device) == 0)
-+    {
-+        adapterBDF->Bus      = device->businfo.pci->bus;
-+        adapterBDF->Device   = device->businfo.pci->dev;
-+        adapterBDF->Function = device->businfo.pci->func;
-+    }
-+    else
-+    {
-+        adapterBDF->Data = 0;
-+    }
-+
-+    return MOS_STATUS_SUCCESS;
-+}
-+
- MOS_STATUS MosInterface::DestroyGpuContext(
-     MOS_STREAM_HANDLE  streamState,
-     GPU_CONTEXT_HANDLE gpuContext)
-diff --git a/media_driver/linux/common/os/mos_os_specific.c b/media_driver/linux/common/os/mos_os_specific.c
-index 7b7f57747b..e433c6fe61 100644
---- a/media_driver/linux/common/os/mos_os_specific.c
-+++ b/media_driver/linux/common/os/mos_os_specific.c
-@@ -1190,8 +1190,6 @@ void Linux_Destroy(
-         mos_gem_context_destroy(pOsContext->intel_context);
-     }
- 
--    pOsContext->GmmFuncs.pfnDeleteClientContext(pOsContext->pGmmClientContext);
--
-     MOS_FreeMemAndSetNull(pOsContext);
- }
- 
-@@ -1931,7 +1929,6 @@ MOS_STATUS Mos_DestroyInterface(PMOS_INTERFACE pOsInterface)
-             mos_gem_context_destroy(perStreamParameters->intel_context);
-             perStreamParameters->intel_context = nullptr;
-         }
--        perStreamParameters->GmmFuncs.pfnDeleteClientContext(perStreamParameters->pGmmClientContext);
-         MOS_FreeMemAndSetNull(perStreamParameters);
-         streamState->perStreamParameters = nullptr;
-     }
-@@ -7476,13 +7473,6 @@ MOS_STATUS Mos_Specific_InitInterface(
-         // Create Linux OS Context
-         pOsContext = (PMOS_OS_CONTEXT)MOS_AllocAndZeroMemory(sizeof(MOS_OS_CONTEXT));
-         MOS_OS_CHK_NULL_RETURN(pOsContext);
--
--        if (GMM_SUCCESS != OpenGmm(&pOsContext->GmmFuncs))
--        {
--            MOS_OS_ASSERTMESSAGE("Unable to open gmm");
--            eStatus = MOS_STATUS_INVALID_PARAMETER;
--            goto finish;
--        }
-     }
- 
-     if (pOsInterface->modulizedMosEnabled && !Mos_Solo_IsEnabled(nullptr))
-@@ -7513,12 +7503,12 @@ MOS_STATUS Mos_Specific_InitInterface(
-         {
-             OsContextSpecific *pOsContextSpecific = static_cast<OsContextSpecific *>(pOsInterface->osContextPtr);
-             pOsContext->intel_context             = pOsContextSpecific->GetDrmContext();
--            pOsContext->pGmmClientContext         = pOsContext->GmmFuncs.pfnCreateClientContext((GMM_CLIENT)GMM_LIBVA_LINUX);
-+            pOsContext->pGmmClientContext         = pOsDriverContext->pGmmClientContext;
-         }
-     }
-     else
-     {
--        pOsContext->pGmmClientContext = pOsContext->GmmFuncs.pfnCreateClientContext((GMM_CLIENT)GMM_LIBVA_LINUX);
-+        pOsContext->pGmmClientContext = pOsDriverContext->pGmmClientContext;
-     }
- 
-     MOS_ZeroMemory(&UserFeatureData, sizeof(UserFeatureData));
-diff --git a/media_driver/media_top_cmake.cmake b/media_driver/media_top_cmake.cmake
-index d0d8cb5244..426728e16d 100755
---- a/media_driver/media_top_cmake.cmake
-+++ b/media_driver/media_top_cmake.cmake
-@@ -142,7 +142,7 @@ if (NOT DEFINED INCLUDED_LIBS OR "${INCLUDED_LIBS}" STREQUAL "")
-     endif()
- 
-     target_compile_options( ${LIB_NAME} PUBLIC ${LIBGMM_CFLAGS_OTHER})
--    target_link_libraries ( ${LIB_NAME} ${LIBGMM_LIBRARIES})
-+    target_link_libraries ( ${LIB_NAME} ${LIBGMM_LIBRARIES} drm)
- 
-     include(${MEDIA_EXT_CMAKE}/ext/media_feature_include_ext.cmake OPTIONAL)
- 
-diff --git a/media_softlet/agnostic/common/os/mos_interface.h b/media_softlet/agnostic/common/os/mos_interface.h
-index 42e4acc6f6..6ae60d8e49 100644
---- a/media_softlet/agnostic/common/os/mos_interface.h
-+++ b/media_softlet/agnostic/common/os/mos_interface.h
-@@ -1815,6 +1815,22 @@ class MosInterface
-         COMMAND_BUFFER_HANDLE cmdBuf,
-         MOS_SUBMISSION_TYPE   type);
- 
-+    //!
-+    //! \brief    Get Adapter BDF
-+    //! \details  [System info Interface] Get Adapter BDF
-+    //! \details  Caller: DDI & HAL
-+    //! \details  This func is called to differentiate the behavior according to Adapter BDF.
-+    //!
-+    //! \param    [in] mosCtx
-+    //!           Pointer of Mos context
-+    //! \param    [out] adapterBDF
-+    //!           Adapter BDF info
-+    //!
-+    //! \return   MOS_STATUS
-+    //!           MOS_STATUS_SUCCESS if success, else fail reason
-+    //!
-+    static MOS_STATUS GetAdapterBDF(PMOS_CONTEXT mosCtx, ADAPTER_BDF *adapterBDF);
-+
- #if _DEBUG || _RELEASE_INTERNAL
-     //!
-     //! \brief    Get engine count
-diff --git a/media_softlet/linux/common/os/mos_context_specific_next.cpp b/media_softlet/linux/common/os/mos_context_specific_next.cpp
-index bd331fba31..6842cc6872 100644
---- a/media_softlet/linux/common/os/mos_context_specific_next.cpp
-+++ b/media_softlet/linux/common/os/mos_context_specific_next.cpp
-@@ -30,6 +30,7 @@
- #include <unistd.h>
- #include <dlfcn.h>
- #include "hwinfo_linux.h"
-+#include "mos_interface.h"
- #include <stdlib.h>
- 
- #include <sys/ipc.h>
-@@ -144,9 +145,10 @@ MOS_STATUS OsContextSpecificNext::Init(DDI_DEVICE_CONTEXT ddiDriverContext)
-             m_platformInfo.eRenderCoreFamily,
-             (m_platformInfo.usRevId << 16) | m_platformInfo.usDeviceID);
- 
--        GMM_SKU_FEATURE_TABLE   gmmSkuTable = {};
--        GMM_WA_TABLE            gmmWaTable  = {};
--        GMM_GT_SYSTEM_INFO      gmmGtInfo   = {};
-+        GMM_SKU_FEATURE_TABLE   gmmSkuTable   = {};
-+        GMM_WA_TABLE            gmmWaTable    = {};
-+        GMM_GT_SYSTEM_INFO      gmmGtInfo     = {};
-+        GMM_ADAPTER_BDF         gmmAdapterBDF = {};
-         eStatus = HWInfo_GetGmmInfo(m_fd, &gmmSkuTable, &gmmWaTable, &gmmGtInfo);
-         if (MOS_STATUS_SUCCESS != eStatus)
-         {
-@@ -154,28 +156,32 @@ MOS_STATUS OsContextSpecificNext::Init(DDI_DEVICE_CONTEXT ddiDriverContext)
-             return eStatus;
-         }
- 
--        GmmExportEntries gmmFuncs  = {};
--        GMM_STATUS       gmmStatus = OpenGmm(&gmmFuncs);
--        if (gmmStatus != GMM_SUCCESS)
-+        eStatus = MosInterface::GetAdapterBDF(osDriverContext, &gmmAdapterBDF);
-+        if (MOS_STATUS_SUCCESS != eStatus)
-         {
--            MOS_OS_ASSERTMESSAGE("Fatal error - gmm init failed.");
--            return MOS_STATUS_INVALID_PARAMETER;
-+            MOS_OS_ASSERTMESSAGE("Fatal error - unsuccesfull Gmm Adapter BDF initialization");
-+            return eStatus;
-         }
- 
--        // init GMM context
--        gmmStatus = gmmFuncs.pfnCreateSingletonContext(m_platformInfo,
--            &gmmSkuTable,
--            &gmmWaTable,
--            &gmmGtInfo);
--
--        if (gmmStatus != GMM_SUCCESS)
-+        // Initialize Gmm context
-+        GMM_INIT_IN_ARGS  gmmInitAgrs = {};
-+        GMM_INIT_OUT_ARGS gmmOutArgs  = {};
-+        gmmInitAgrs.Platform          = m_platformInfo;
-+        gmmInitAgrs.pSkuTable         = &gmmSkuTable;
-+        gmmInitAgrs.pWaTable          = &gmmWaTable;
-+        gmmInitAgrs.pGtSysInfo        = &gmmGtInfo;
-+        gmmInitAgrs.FileDescriptor    = gmmAdapterBDF.Data;
-+        gmmInitAgrs.ClientType        = (GMM_CLIENT)GMM_LIBVA_LINUX;
-+
-+        GMM_STATUS status = InitializeGmm(&gmmInitAgrs, &gmmOutArgs);
-+        if (status != GMM_SUCCESS)
-         {
--            MOS_OS_ASSERTMESSAGE("Fatal error - gmm CreateSingletonContext failed.");
-+            MOS_OS_ASSERTMESSAGE("Fatal error - InitializeGmm fail.");
-             return MOS_STATUS_INVALID_PARAMETER;
-         }
--        m_gmmClientContext = gmmFuncs.pfnCreateClientContext((GMM_CLIENT)GMM_LIBVA_LINUX);
-+        m_gmmClientContext = gmmOutArgs.pGmmClientContext;
- 
--        m_auxTableMgr = AuxTableMgr::CreateAuxTableMgr(m_bufmgr, &m_skuTable);
-+        m_auxTableMgr = AuxTableMgr::CreateAuxTableMgr(m_bufmgr, &m_skuTable, m_gmmClientContext);
- 
-         MOS_ZeroMemory(&UserFeatureData, sizeof(UserFeatureData));
- #if (_DEBUG || _RELEASE_INTERNAL)
-@@ -266,18 +272,11 @@ void OsContextSpecificNext::Destroy()
- 
-         mos_bufmgr_destroy(m_bufmgr);
- 
--        GmmExportEntries GmmFuncs;
--        GMM_STATUS       gmmStatus = OpenGmm(&GmmFuncs);
--        if (gmmStatus == GMM_SUCCESS)
--        {
--            GmmFuncs.pfnDeleteClientContext((GMM_CLIENT_CONTEXT *)m_gmmClientContext);
--            m_gmmClientContext = nullptr;
--            GmmFuncs.pfnDestroySingletonContext();
--        }
--        else
--        {
--            MOS_OS_ASSERTMESSAGE("gmm init failed.");
--        }
-+        // Delete Gmm context
-+        GMM_INIT_OUT_ARGS gmmOutArgs = {};
-+        gmmOutArgs.pGmmClientContext = m_gmmClientContext;
-+        GmmAdapterDestroy(&gmmOutArgs);
-+        m_gmmClientContext = nullptr;
- 
-         SetOsContextValid(false);
-     }
diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index c2a8e2a240..38121da036 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9b5ef7716c5d8199229512020c18dce5cabee25fbf3f1912179502bedb655919  intel-media-21.4.3.tar.gz
+sha256  6c1cd5c4c1b7bd1c7785ed4d553b76b17dd7e673619a39e0c3070246aa671024  intel-media-22.1.0.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 7e949b5e7a..6cadc3612c 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 21.4.3
+INTEL_MEDIADRIVER_VERSION = 22.1.0
 INTEL_MEDIADRIVER_SITE = http://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
