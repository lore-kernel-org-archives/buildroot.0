From: Rahul Jain <rahul.jain@imgtec.com>
Date: Wed, 29 Mar 2017 16:08:35 +0530
Subject: [Buildroot] [PATCH 6/6] libubox: enable static build
In-Reply-To: <29802569-43e0-ee44-da29-d7f76d6002d9@mind.be>
References: <1490359795-18362-1-git-send-email-Rahul.Jain@imgtec.com>
 <1490359795-18362-6-git-send-email-Rahul.Jain@imgtec.com>
 <29802569-43e0-ee44-da29-d7f76d6002d9@mind.be>
Message-ID: <58DB8EAB.2030309@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Thanks for your comments.

On Friday 24 March 2017 06:37 PM, Arnout Vandecappelle wrote:
>
>
> On 24-03-17 13:49, Rahul Jain wrote:
>> upstream has added the support to build the static libraries.
>> update comment for BR2_STATIC_LIBS for other packages having
>> dependency on libubox.
>
>   The reason why that comment is there, is so we remember that when libubox is
> allowed to be built statically, we should check if ubus and ustream-ssl perhaps
> now also can be built statically. So, did you check that? If yes, you should
> update the comment as to why they can't be build statically (e.g. "dlopen()",
> see other Config.in files).

I have checked package cmake files and found out that there is no 
support for building static libraries in ubus and ustream-ssl packages.
I will add a comment '#no support to build static libraries in config file'.
