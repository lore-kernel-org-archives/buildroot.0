From: Spenser Gilliland <spenser@gillilanding.com>
Date: Wed, 26 Jun 2013 13:02:13 -0500
Subject: [Buildroot] [RFC v2 1/1] ti-gfx: add new package
In-Reply-To: <321768C95D21724485BCE784F1BE98473EB59AB1@DBDE04.ent.ti.com>
References: <1372177754-13431-1-git-send-email-spenser@gillilanding.com>
 <321768C95D21724485BCE784F1BE98473EB59AB1@DBDE04.ent.ti.com>
Message-ID: <20130626130213.12d5cf60@bourban>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 26 Jun 2013 02:26:13 +0000
"Sundareson, Prabindh" <prabu@ti.com> wrote:

> Hello Spenser,
> 
> There are 2 separate Graphics SDK packages for hard and soft float
> support. If you use "
> http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/latest//exports/Graphics_SDK_setuplinux_4_09_00_01_hardfp_minimal_demos.bin" ,
> you get hard float support.
> 
> >>   You must use a soft-float toolchain (ie Code Sourcery) as the
> >> binaries
>    provided by the Graphics SDK are soft-float. (hard float is on the
> TODO list)
> 
> 
> Which demos do not run ? Any logs ? I can come on IRC if help is
> needed,

Here's some logs from failed tests. Also, I attempted to run the ews_server 
without success.  All other tests run to completion and have a return
code of 0.  

# sgx_render_flip_test 
----------------------- Start -----------------------
[ 7870.928863] PVR_K:(Error): PVRSRVCreateDCSwapChainKM: Failed to
create 3rd party SwapChain [1409,
home/spenser/Code/buildroot/output/build/ti-gfx-4_09_00_01/GFX_Linux_KM/services4/srvkm/common/deviceclass.c]
PVR:(Error): PVRSRVCreateDCSwapChain: Error - 18 returned
[505, /bridged_pvr_dc_glue.c] Unable to create Display Class flip chain
(PVRSRV_ERROR_TOOMANYBUFFERS) Consider disabling flipping using the
option -nf Aborted

# sgx_flip_test
----------------------- Start -----------------------
Call PVRSRVConnect with a valid argument:[ 7794.178863] PVR_K:(Error):
PVRSRVCreateDCSwapChainKM: Failed to create 3rd party SwapChain [1409,
home/spenser/Code/buildroot/output/build/ti-gfx-4_09_00_01/GFX_Linux_KM/services4/srvkm/common/deviceclass.c]

 OK
Get number of devices from PVRSRVEnumerateDevices:
 OK
.... Reported 1 devices
.... Device Number  | Device Type
            0000    | PVRSRV_DEVICE_ID_SGX
Attempt to acquire device 0:
 OK
Getting SGX Client info
 OK
.... ui32ProcessID:1272
Display Class API: enumerate devices
 OK
PVRSRVEnumerateDeviceClass() returns 1 display device(s)
 OK
Attempt to create memory context for SGX:
 OK
Display Class API: open device
 OK
Display Class API: Get display info
 OK
.... Name:PowerVR OMAP Linux Display Driver
.... MaxSwapChains:1
.... MaxSwapChainBuffers:1
.... MinSwapInterval:0
.... MaxSwapInterval:1
Display Class API: enumerate display formats
 OK
 OK
.... Display format 0 - Pixelformat:1
Display Class API: enumerate display dimensions
 OK
 OK
.... Display dimensions 0 - ByteStride:1280 Width:640 Height:480
Display Class API: get the system (primary) buffer
 OK
.... Shared heap 0 - HeapID:0x7000000 DevVAddr:0x1000 Size:0x87fe000
 Attr:0x2014200 .... Shared heap 1 - HeapID:0x7000001
 DevVAddr:0xc800000 Size:0xfff000 Attr:0x2024200 .... Shared heap 2 -
 HeapID:0x7000002 DevVAddr:0xe400000 Size:0x7f000 Attr:0x2024200 ....
 Shared heap 3 - HeapID:0x7000003 DevVAddr:0xf000000 Size:0x3ff000
 Attr:0x2024200 .... Shared heap 4 - HeapID:0x7000004
 DevVAddr:0xf400000 Size:0x4ff000 Attr:0x2014200 .... Shared heap 5 -
 HeapID:0x7000005 DevVAddr:0xfc00000 Size:0x1ff000 Attr:0x2014200 ....
 Shared heap 6 - HeapID:0x7000006 DevVAddr:0xdc00000 Size:0x7ff000
 Attr:0x2014200 .... Shared heap 7 - HeapID:0x7000007
 DevVAddr:0xe800000 Size:0x7ff000 Attr:0x2014200 .... Shared heap 8 -
 HeapID:0x7000008 DevVAddr:0xd800000 Size:0x3ff000 Attr:0x2024200 ....
 Shared heap 9 - HeapID:0x7000009 DevVAddr:0x8800000 Size:0x0
 Attr:0x2024200 .... Shared heap 10 - HeapID:0x700000a
 DevVAddr:0x8800000 Size:0x3fff000 Attr:0x2014200 Display Class API:
 map display surface to SGX OK PVR:(Error): PVRSRVCreateDCSwapChain:
 Error - 18 returned [505, /bridged_pvr_dc_glue.c] FAIL -
 PVRSRV_ERROR_TOOMANYBUFFERS #
 
# ews_server
PVR: Hint: Setting WindowSystem to libpvrPVR2D_FRONTWSEGL.so
PVR:(Error): PVRSRVMetricsTimeNow: using (potentially) low resolution
timer [95, /pvr_metrics.c] PVR:(Warning): LoadWSModule: Window system
module libpvrPVR2D_FRONTWSEGL.so did not validate native display
[116, /generic_ws.c] PVR:(Warning): LoadWSModule: Window system module
libpvrPVR2D_FLIPWSEGL.so did not validate native display
[116, /generic_ws.c] PVR:(Error): Couldn't load WS module
libpvrPVR2D_DRIWSEGL.so [62, /generic_ws.c] EWS: Fatal error:
eglGetDisplay EWS:    (in pm_thread_main at pm.c line 295) Aborted

Regards,
Spenser
