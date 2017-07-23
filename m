From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 23 Jul 2017 08:19:51 -0500
Subject: [Buildroot] [PATCH 1/1] nginx-upload-module: add openssl lib
	dependency
In-Reply-To: <f36d741d-93ac-a9ca-1301-186742c2700f@mind.be>
References: <1500782443-1515-1-git-send-email-matthew.weber@rockwellcollins.com>
 <f36d741d-93ac-a9ca-1301-186742c2700f@mind.be>
Message-ID: <CANQCQpYyEg4kHTAVARQWsc39U+nhhcCirAn_z4==+tUHBuJ+rA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Sun, Jul 23, 2017 at 7:56 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 23-07-17 06:00, Matt Weber wrote:
> [snip]
>> +From dcfb052988b333382fc7696fd811eb547734797a Mon Sep 17 00:00:00 2001
>> +From: Matt Weber <matthew.weber@rockwellcollins.com>
>> +Date: Sat, 22 Jul 2017 22:24:50 -0500
>> +Subject: [PATCH 1/1] nginx-upload-module: add openssl lib dependency
>
>  Please use git format-patch -N
>

Sure.

> [snip]
>> +diff --git a/config b/config
>> +index cabd4f1..4a77858 100644
>> +--- a/config
>> ++++ b/config
>> +@@ -1,14 +1,13 @@
>> +-USE_MD5=YES
>> +-USE_SHA1=YES
>> + ngx_addon_name=ngx_http_upload_module
>> +
>> + if test -n "$ngx_module_link"; then
>> +     ngx_module_type=HTTP
>> +     ngx_module_name=$ngx_addon_name
>> +     ngx_module_srcs="$ngx_addon_dir/ngx_http_upload_module.c"
>> ++    ngx_module_libs=-lcrypto
>
>  Is there any reason not to use pkg-config, like we do in nginx itself (in
> 0006-auto-lib-openssl-conf-use-pkg-config.patch)?

Yeah that should work, I'll rework and test.

>
>> +
>> +     . auto/module
>> + else
>> +     HTTP_MODULES="$HTTP_MODULES ngx_http_upload_module"
>> +     NGX_ADDON_SRCS="$NGX_ADDON_SRCS $ngx_addon_dir/ngx_http_upload_module.c"
>> +-fi
>> +\ No newline at end of file
>> ++fi
>
>  This hunk is not needed.

Sure.

Thanks for the review,
Matt
