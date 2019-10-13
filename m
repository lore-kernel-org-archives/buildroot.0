From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 13 Oct 2019 18:12:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/webkitgtk: fix gstreamer-gl
 dependency
In-Reply-To: <CADvTj4ppoXw+Huc4odkciDzdUfimcupzmbsoanf4oHh7mLKkWg@mail.gmail.com>
References: <20190807192313.118268-1-james.hilliard1@gmail.com>
 <47167465-83d8-ccc0-97e7-9972c0888d21@mind.be>
 <CADvTj4ppoXw+Huc4odkciDzdUfimcupzmbsoanf4oHh7mLKkWg@mail.gmail.com>
Message-ID: <41c77468-c331-2738-ca6b-ffeb3c305e61@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/10/2019 14:39, James Hilliard wrote:
> On Sat, Oct 12, 2019 at 12:19 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>
>>
>> On 07/08/2019 21:23, James Hilliard wrote:
>>> The gstreamer1 opengl plugin was moved from gst1-plugins-bad to
>>> gst1-plugins-base so we need to update webkitgtk to depend on the
>>> correct package.
>>>
>>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>>> ---
>>>  package/webkitgtk/Config.in    | 3 +--
>>>  package/webkitgtk/webkitgtk.mk | 1 -
>>>  2 files changed, 1 insertion(+), 3 deletions(-)
>>>
>>> diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
>>> index db67c89042..d822bec06a 100644
>>> --- a/package/webkitgtk/Config.in
>>> +++ b/package/webkitgtk/Config.in
>>> @@ -95,8 +95,7 @@ if BR2_PACKAGE_WEBKITGTK_MULTIMEDIA
>>>  config BR2_PACKAGE_WEBKITGTK_USE_GSTREAMER_GL
>>>       bool "use gstreamer-gl"
>>>       default y
>>> -     depends on BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL
>>> -     select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL
>>> +     depends on BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL
>>
>>  Here I'm not so sure: is OPENGL_API sufficient or does it really need
>> OPENGL_OPENGL?
> Not entirely sure but seemed to be the case for wpewebkit at least.

 Do you mean wpewebkit's gstreamer-gl option does not work with OPENGL_GLES2?

 Regards,
 Arnout
