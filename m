From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 6 Mar 2014 11:35:09 +0100
Subject: [Buildroot] [PATCH] gst1-plugins-bad: add missing opencv ml
 module dependency
In-Reply-To: <53184691.40008@imgtec.com>
References: <1394060130-4805-1-git-send-email-s.martin49@gmail.com>
 <53184691.40008@imgtec.com>
Message-ID: <CAHXCMMKaDN_F5VQJ-6CfYJ=iQV6g94E9GmdMYgLqLFnYuodkxg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vincente,

On Thu, Mar 6, 2014 at 10:57 AM, Vicente Olivert Riera
<Vincent.Riera@imgtec.com> wrote:
> On 03/05/2014 10:55 PM, Samuel Martin wrote:
>>
>> gst1-plugins-bad source code does include the old-style global opencv
>> header "opencv/cv.h", which includes headers from the core, imgproc,
>> video, features2d, flann, calib3d, objdetect and legacy modules.
>>
>> However, the legacy module, in addition to headers from some of the
>> previously listed modules, also includes headers from the ml module.
>>
>> Thus, the ml module must be selected to be able to build the legacy
>> one, so the gst-plugins-bad's opencv plugin.
>>
>> Fixes:
>>
>> http://autobuild.buildroot.net/results/d02/d02e1843ef90f4b40c99e3b23eddf376f827d46e/
>>
>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>> ---
>>   package/gstreamer1/gst1-plugins-bad/Config.in | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in
>> b/package/gstreamer1/gst1-plugins-bad/Config.in
>> index 0685322..2c5c290 100644
>> --- a/package/gstreamer1/gst1-plugins-bad/Config.in
>> +++ b/package/gstreamer1/gst1-plugins-bad/Config.in
>> @@ -434,6 +434,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENCV
>>         select BR2_PACKAGE_OPENCV_LIB_FLANN
>>         select BR2_PACKAGE_OPENCV_LIB_IMGPROC
>>         select BR2_PACKAGE_OPENCV_LIB_LEGACY
>> +       select BR2_PACKAGE_OPENCV_LIB_ML
>>         select BR2_PACKAGE_OPENCV_LIB_OBJDETECT
>>         select BR2_PACKAGE_OPENCV_LIB_VIDEO
>>         help
>>
>
> Maybe your BR tree wasn't up to date in the moment to write this patch. Look
> at this:
>
> http://git.buildroot.net/buildroot/commit/?id=3324f4e8b69ab49783a233b27c9b2edeecedb5ce

The worktree was up-to-date and includes this commit.

It's just an opencv module interdependency problem, see this opencv
configure log [1], the legacy module is "disabled by dependency"
because the ml one is disabled.

I've post a patch fixing this issue [2] in another series.

[1] http://code.bulix.org/oxmmde-85789
[2] http://patchwork.ozlabs.org/patch/320821/

Regards,

-- 
Samuel
