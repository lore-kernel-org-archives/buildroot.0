From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Date: Mon, 3 Oct 2016 14:07:43 +0200
Subject: [Buildroot] [PATCH v3 1/2] spidermonkey185: New package.
In-Reply-To: <14i9cdxqle.ln2@ID-313208.user.individual.net>
References: <0dc17f18-b259-a618-67f3-099fd6ef0897@green-communications.fr>
 <1467800649-22119-1-git-send-email-nicolas.cavallari@green-communications.fr>
 <14i9cdxqle.ln2@ID-313208.user.individual.net>
Message-ID: <9ff10f2f-7ca2-f5ca-a25b-6f6582ef2f2e@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/10/2016 10:40, Bernd Kuhls wrote:
> The package fails to compile using this toolchain:
> http://autobuild.buildroot.net/toolchains/configs/br-x86-64-core2-
> full.config
> 
> jsapi.cpp:361:63: error: cannot convert ?__va_list_tag**? to 
> ?__va_list_tag (*)[1]? for argument ?5? to ?JSBool TryArgumentFormatter
> (JSContext*, const char**, JSBool, jsval**, __va_list_tag (*)[1])?
>                                        JS_ADDRESSOF_VA_LIST(ap))) {
> 
> To solve the problem add
> 
> printf("#define HAVE_VA_LIST_AS_ARRAY \n");
> 
> in js/src/jscpucfg.cpp after line 76 according to
> https://groups.google.com/forum/#!topic/jsdb/CnWRh11hRHQ

This link mention other modifications that one has to do for it to
run.  I'm not sure i can just "pick them up" if they do not have a
license.
