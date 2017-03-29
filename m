From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 29 Mar 2017 14:38:20 +0200
Subject: [Buildroot] [PATCH 6/6] libubox: enable static build
In-Reply-To: <58DB8EAB.2030309@imgtec.com>
References: <1490359795-18362-1-git-send-email-Rahul.Jain@imgtec.com>
 <1490359795-18362-6-git-send-email-Rahul.Jain@imgtec.com>
 <29802569-43e0-ee44-da29-d7f76d6002d9@mind.be> <58DB8EAB.2030309@imgtec.com>
Message-ID: <a1e73368-1901-c570-a157-fda953bac134@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29-03-17 12:38, Rahul Jain wrote:
> Hi Arnout,
> 
> Thanks for your comments.
> 
> On Friday 24 March 2017 06:37 PM, Arnout Vandecappelle wrote:
>>
>>
>> On 24-03-17 13:49, Rahul Jain wrote:
>>> upstream has added the support to build the static libraries.
>>> update comment for BR2_STATIC_LIBS for other packages having
>>> dependency on libubox.
>>
>>   The reason why that comment is there, is so we remember that when libubox is
>> allowed to be built statically, we should check if ubus and ustream-ssl perhaps
>> now also can be built statically. So, did you check that? If yes, you should
>> update the comment as to why they can't be build statically (e.g. "dlopen()",
>> see other Config.in files).
> 
> I have checked package cmake files and found out that there is no support for
> building static libraries in ubus and ustream-ssl packages.

 If nothing specific is done in the CMakeLists.txt, it *will* support building
static libraries. Only if some custom commands are used instead of
TARGET_LINK_LIBRARIES it needs special treatment.

 The best way to be sure is just to test it: start from
http://autobuild.buildroot.net/toolchains/configs/br-arm-full-static.config
enable BR2_STATIC_LIBS, remove the dependency on !BR2_STATIC_LIBS, and build it.

 Regards,
 Arnout

> I will add a comment '#no support to build static libraries in config file'.

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
