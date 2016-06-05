From: Doha Ehab <dohaehab@gmail.com>
Date: Mon, 6 Jun 2016 00:06:43 +0200
Subject: [Buildroot] Building opencv using buildroot
Message-ID: <CAEjFr-bhO5DBoSsQ1R0Yzo=cKWThUjQRWoXCiaVF7W3pMX+PSQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
I am using Buildroot 2016.05-rc1 to statically build openvc. so From the
configurations menu  target packges -> libraries -> graphics-> opencv-2.4 I
have selected all features for opencv(except v4l and qt backend support).
After "make" I compiled a simple code that reads a jpg image using this
command:

/buildroot-2Final/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++
ocv.c -L/buildroot-2Final/output/build/opencv-2.4.12.3/ -lopencv_calib3d
-lopencv_contrib -lopencv_core -lopencv_features2d -lopencv_flann
-lopencv_highgui -lopencv_imgproc -lopencv_legacy -lopencv_ml
-lopencv_objdetect  -lopencv_photo -lopencv_stitching -lopencv_superres
-lopencv_ts -lopencv_video -lopencv_videostab -lz -lrt -lpthread -pthread
-lm   -o ocv

I got this error  :
buildroot-2Final/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libopencv_highgui.a(grfmt_jpeg.cpp.o):
In function `cv::my_jpeg_load_dht(jpeg_decompress_struct*, unsigned char*,
JHUFF_TBL**, JHUFF_TBL**) [clone .constprop.39]':
grfmt_jpeg.cpp:(.text.unlikely._ZN2cvL16my_jpeg_load_dhtEP22jpeg_decompress_structPhPP9JHUFF_TBLS5_.constprop.39+0xec):
undefined reference to `jpeg_alloc_huff_table'
/buildroot-2Final/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libopencv_highgui.a(grfmt_jpeg.cpp.o):
In function `cv::JpegEncoder::write(cv::Mat const&, std::vector<int,
std::allocator<int> > const&)':
grfmt_jpeg.cpp:(.text._ZN2cv11JpegEncoder5writeERKNS_3MatERKSt6vectorIiSaIiEE+0xb4):
undefined reference to `jpeg_CreateCompress'
grfmt_jpeg.cpp:(.text._ZN2cv11JpegEncoder5writeERKNS_3MatERKSt6vectorIiSaIiEE+0xbc):
undefined reference to `jpeg_std_error'
grfmt_jpeg.cpp:(.text._ZN2cv11JpegEncoder5writeERKNS_3MatERKSt6vectorIiSaIiEE+0x170):
undefined reference to `jpeg_destroy_compress'
grfmt_jpeg.cpp:(.text._ZN2cv11JpegEncoder5writeERKNS_3MatERKSt6vectorIiSaIiEE+0x270):
undefined reference to `jpeg_set_defaults'
grfmt_jpeg.cpp:(.text._ZN2cv11JpegEncoder5writeERKNS_3MatERKSt6vectorIiSaIiEE+0x280):
undefined reference to `jpeg_set_quality'
grfmt_jpeg.cpp:(.text._ZN2cv11JpegEncoder5writeERKNS_3MatERKSt6vectorIiSaIiEE+0x28c):
undefined reference to `jpeg_start_compress'
grfmt_jpeg.cpp:(.text._ZN2cv11JpegEncoder5writeERKNS_3MatERKSt6vectorIiSaIiEE+0x308):
undefined reference to `jpeg_write_scanlines'
grfmt_jpeg.cpp:(.text._ZN2cv11JpegEncoder5writeERKNS_3MatERKSt6vectorIiSaIiEE+0x320):
undefined reference to `jpeg_finish_compress'
grfmt_jpeg.cpp:(.text._ZN2cv11JpegEncoder5writeERKNS_3MatERKSt6vectorIiSaIiEE+0x3a8):
undefined reference to `jpeg_stdio_dest'
grfmt_jpeg.cpp:(.text._ZN2cv11JpegEncoder5writeERKNS_3MatERKSt6vectorIiSaIiEE+0x41c):
undefined reference to `jpeg_write_scanlines'
grfmt_jpeg.cpp:(.text._ZN2cv11JpegEncoder5writeERKNS_3MatERKSt6vectorIiSaIiEE+0x4a8):
undefined reference to `jpeg_write_scanlines'

I have select jpeg support also there is no liblibjpeg in
/buildroot-2Final/output/build/opencv-2.4.12.3/3rdparty. I want to know
what I am missing or doing wrong.

Regards
Doha
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160606/e1094a96/attachment.html>
