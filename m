From: Carlo Caione <carlo.caione@gmail.com>
Date: Fri, 8 Mar 2013 11:07:50 +0100
Subject: [Buildroot] [PATCH 1/3] sunxi-tools: new host package
In-Reply-To: <CAHXCMMKh9EFBAaOP6SHNb2CmY20AmAFStfMxz8Wcara3QUEENA@mail.gmail.com>
References: <1362695964-20697-1-git-send-email-carlo.caione@gmail.com>
 <CAHXCMMKh9EFBAaOP6SHNb2CmY20AmAFStfMxz8Wcara3QUEENA@mail.gmail.com>
Message-ID: <CAOQ7t2ZWt4TyvXirtC5qKHQsePhMXR0g9Qoz+7rgmAB9zw0WyA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 8, 2013 at 10:37 AM, Samuel Martin <s.martin49@gmail.com> wrote:
> Hi Carlo,
[cut]
>> +config BR2_PACKAGE_HOST_SUNXI_TOOLS
>> +       bool "host sunxi-tools"
>> +       help
>> +          Tools to help hacking Allwinner A10 (aka sun4i) based devices and
> Looks like the indentation is wrong (spaces instead of 1 tab + 2 spaces).

Uhm ... I'll check it out ...

>> +         possibly it's successors
>> +
>> +         https://github.com/linux-sunxi/sunxi-tools
>> diff --git a/package/sunxi-tools/sunxi-tools.mk b/package/sunxi-tools/sunxi-tools.mk
>> new file mode 100644
>> index 0000000..60acff5
>> --- /dev/null
>> +++ b/package/sunxi-tools/sunxi-tools.mk
>> @@ -0,0 +1,20 @@
>> +#############################################################
>> +#
>> +# sunxi-tools
>> +#
>> +#############################################################
>> +
>> +SUNXI_TOOLS_VERSION = master
>
> In Buildroot, we usually use commit sha1 instead of branch name;
> otherwise it makes hard to spot what change in a package may have break a build.

You are definitely right.

>> +SUNXI_TOOLS_SITE = git://github.com/linux-sunxi/sunxi-tools.git
>
> BTW, with packages hosted on github, it is possible to just download
> the tarball of the source at a given revision,
> see: http://buildroot.org/downloads/manual/manual.html#github-download-url

Ups ... It seems like I skipped that part.

Thank you for the suggestions ... I will prepare a second submission.

--
Carlo
