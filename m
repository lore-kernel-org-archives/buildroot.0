From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 14 Jun 2015 16:05:05 +0200
Subject: [Buildroot] [PATCH v5 03/13] package/opencv: bump to version 3.0
In-Reply-To: <20150607120316.GD3545@free.fr>
References: <1433672799-21387-1-git-send-email-s.martin49@gmail.com>
 <1433672799-21387-4-git-send-email-s.martin49@gmail.com>
 <20150607120316.GD3545@free.fr>
Message-ID: <CAHXCMMJXUMg=FnoFd0vnEZeyTQOT0yXtHm212ei=LLRW6C3RGw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, all,

On Sun, Jun 7, 2015 at 2:03 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
[...]
>>  # OpenCV module selection
>> +# - contrib modules are disabled.
>
> 'disabled' or 'no longer exist' ?
Sorry for the confusion, I mean:
opencv contrib modules from [1] are not available because we don't set
the OPENCV_EXTRA_MODULES_PATH CMake configure option.

I'll make the comment less cryptic in the next revision ;-).

>
>>  OPENCV_CONF_OPTS += \
>>       -DBUILD_opencv_androidcamera=OFF \
>>       -DBUILD_opencv_apps=OFF \
>>       -DBUILD_opencv_calib3d=$(if $(BR2_PACKAGE_OPENCV_LIB_CALIB3D),ON,OFF) \
>> -     -DBUILD_opencv_contrib=$(if $(BR2_PACKAGE_OPENCV_LIB_CONTRIB),ON,OFF) \
>>       -DBUILD_opencv_core=ON \
>> -     -DBUILD_opencv_dynamicuda=OFF \
>>       -DBUILD_opencv_features2d=$(if $(BR2_PACKAGE_OPENCV_LIB_FEATURES2D),ON,OFF) \
>>       -DBUILD_opencv_flann=$(if $(BR2_PACKAGE_OPENCV_LIB_FLANN),ON,OFF) \
>> -     -DBUILD_opencv_gpu=$(if $(BR2_PACKAGE_OPENCV_LIB_GPU),ON,OFF) \
>> +     -DBUILD_opencv_hal=ON \
>>       -DBUILD_opencv_highgui=$(if $(BR2_PACKAGE_OPENCV_LIB_HIGHGUI),ON,OFF) \
>> +     -DBUILD_opencv_imgcodecs=$(if $(BR2_PACKAGE_OPENCV_LIB_IMGCODECS),ON,OFF) \
>>       -DBUILD_opencv_imgproc=$(if $(BR2_PACKAGE_OPENCV_LIB_IMGPROC),ON,OFF) \
>>       -DBUILD_opencv_java=OFF \
>> -     -DBUILD_opencv_legacy=$(if $(BR2_PACKAGE_OPENCV_LIB_LEGACY),ON,OFF) \
>>       -DBUILD_opencv_ml=$(if $(BR2_PACKAGE_OPENCV_LIB_ML),ON,OFF) \
>> -     -DBUILD_opencv_nonfree=$(if $(BR2_PACKAGE_OPENCV_LIB_NONFREE),ON,OFF) \
>>       -DBUILD_opencv_objdetect=$(if $(BR2_PACKAGE_OPENCV_LIB_OBJDETECT),ON,OFF) \
>> -     -DBUILD_opencv_ocl=OFF \
>>       -DBUILD_opencv_photo=$(if $(BR2_PACKAGE_OPENCV_LIB_PHOTO),ON,OFF) \
>> -     -DBUILD_opencv_python=OFF \
>> +     -DBUILD_opencv_python2=OFF \
>> +     -DBUILD_opencv_python3=OFF \
>> +     -DBUILD_opencv_shape=$(if $(BR2_PACKAGE_OPENCV_LIB_SHAPE),ON,OFF) \
>>       -DBUILD_opencv_stitching=$(if $(BR2_PACKAGE_OPENCV_LIB_STITCHING),ON,OFF) \
>>       -DBUILD_opencv_superres=$(if $(BR2_PACKAGE_OPENCV_LIB_SUPERRES),ON,OFF) \
>>       -DBUILD_opencv_ts=$(if $(BR2_PACKAGE_OPENCV_LIB_TS),ON,OFF) \
>>       -DBUILD_opencv_video=$(if $(BR2_PACKAGE_OPENCV_LIB_VIDEO),ON,OFF) \
>> +     -DBUILD_opencv_videoio=$(if $(BR2_PACKAGE_OPENCV_LIB_VIDEOIO),ON,OFF) \
>>       -DBUILD_opencv_videostab=$(if $(BR2_PACKAGE_OPENCV_LIB_VIDEOSTAB),ON,OFF) \
>> +     -DBUILD_opencv_viz=OFF \
>
> Any reason not to add a Config.in option for viz?

Yes, it needs VTK. I'll add a comment about it as well in the next
revision of the patch.

Regards,

[1] https://github.com/itseez/opencv_contrib

-- 
Samuel
