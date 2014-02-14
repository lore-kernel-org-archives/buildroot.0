From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri, 14 Feb 2014 14:27:35 +0100
Subject: [Buildroot] [PATCH v5 4/5] dependencies.sh: XBMC needs java on
 the host
In-Reply-To: <20140214065155.4c287dac@core2quad.morethan.org>
References: <1392332394-27935-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1392332394-27935-5-git-send-email-maxime.hadjinlian@gmail.com>
 <20140214093930.02727f8e@skate>
 <20140214065155.4c287dac@core2quad.morethan.org>
Message-ID: <CAGduivz=G4YY+YDMFHmY_qGzx8Ub2JOa9Zs4SukmvdLq7tfx5g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 14, 2014 at 1:51 PM, Mike Zick <minimod@morethan.org> wrote:
> On Fri, 14 Feb 2014 09:39:30 +0100
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
>
>> Dear Maxime Hadjinlian,
>>
>> On Thu, 13 Feb 2014 23:59:53 +0100, Maxime Hadjinlian wrote:
>>
>> > +if grep -q ^BR2_PACKAGE_XBMC=y $BUILDROOT_CONFIG ; then
>> > +   for prog in java; do
>>
>> Since you're checking for only one program, there's no point in having
>> a loop here. Just do:
>>
>>       if ! which java > /dev/null ; then
>>
>
> Wasn't there a patch this development session that replaced
> the use of "which" with a standards compliant command?
You are right, you are talking about:
http://thread.gmane.org/gmane.comp.lib.uclibc.buildroot/75049/
But as you can see it was never merged.
Maybe this patch should be bumped again ? It seems there was a problem
with the aliases the user can set but Arnout had an idea about that.
>
> Mike
>>
>> Thanks,
>>
>> Thomas
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
