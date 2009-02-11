From: Dan Pattison <dan.pattison@ethertek.ca>
Date: Tue, 10 Feb 2009 17:35:15 -0800
Subject: [Buildroot] Easy Upgrade Path?
In-Reply-To: <d6cda7730902091413h5e7cbd21ra41d7154ca60909e@mail.gmail.com>
References: <49907BAE.3020509@ethertek.ca>
	<d6cda7730902091413h5e7cbd21ra41d7154ca60909e@mail.gmail.com>
Message-ID: <49922B53.50608@ethertek.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for the reply Thiago. I will see if I can get a svn server going 
and try your method.

Best Regards,
Dan Pattison


Thiago A. Corr?a wrote:
> Hi Dan
>
> On Mon, Feb 9, 2009 at 4:53 PM, Dan Pattison <dan.pattison@ethertek.ca> wrote:
>   
>> I've been getting used to the buildroot development environment using
>> 2009.02-RC2 for ARM AT91SAM9g20-EK. I have made lots of changes and
>> additions that suit our project (config files, packages, etc.) We have
>> successfully compiled and included some of our own programs.
>>
>> What is the recommended method to upgrade to the newest build environment so
>> we don't have to re-do everything? Is this possible?
>>
>>     
>
> I don't know if there is any recommended way. None is documented, and
> I guess each one does whatever they see best.
>
> I had the same problem as you, and after some thought I decided the
> best approach would be to "fork" from buildroot svn to my own private
> svn server (svn export) and do my changes there. I've also added a
> file upstream.rev which only contains the last revision from svn that
> I have merged from upstream (svn diff -r last:current >
> upstream-rev.patch && patch -p0 < upstream-rev.patch).
>
> The downside is that svn diff patches doesn't remove files removed
> from the repository, so you need to do that manually. This happens
> most often were patches are stored. A simple diff can catch those then
> you need to manually do svn rm in your repository.
> My own packages (code I've developed) I've added to
> package/mycompany/*, so, when I do a diff between buildroot checkout
> and my repository, I can easily mask that.
>
> Also, generic changes/development, I try to push upstream whenever
> possible. This both benefits other users and also helps us keeping the
> differences smaller, so merges with upstream are a bit easier.
>
> This is far from a good solution, but has worked so far.
>
> Hope this helps.
>
> Best Regards,
>     Thiago A. Correa
>   
> ------------------------------------------------------------------------
>
>
> No virus found in this incoming message.
> Checked by AVG - www.avg.com 
> Version: 8.0.233 / Virus Database: 270.10.19/1941 - Release Date: 02/06/09 11:31:00
>
>   
