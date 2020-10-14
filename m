From: Michael Nosthoff <buildroot@heine.tech>
Date: Wed, 14 Oct 2020 14:49:41 +0200
Subject: [Buildroot] [PATCH 0/1] jquery: bump to version 3.5.1
In-Reply-To: <20201014133713.07b6eea7@windsurf>
References: <20201014110819.udxf25qnvs56nmmo@zenon.in.qult.net>
 <20201014133713.07b6eea7@windsurf>
Message-ID: <f2ea6740-af9e-1b0b-c82a-31791de4f538@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 14.10.2020 13:37, Thomas Petazzoni wrote:
> On Wed, 14 Oct 2020 13:08:19 +0200
> Ignacy Gaw?dzki <ignacy.gawedzki@green-communications.fr> wrote:
>
>> It seems at least some packaged jQuery plugins are not necessarily
>> adapted to support jQuery version 3+.  It seems jquery-datetimepicker
>> may not be compatible, while jquery-sidebar declares no dependency on
>> any jquery version, but has not been updated for the past five years.
> So perhaps we should drop those jquery plugins from Buildroot before
> updating, no? Or you're just not sure that they are not compatible ?



jquery-datetimepicker seems to still be alive. see [0]. If I look at the
npm page [1] it seems to have some dependencies which makes me wonder if
this package was ever actually usable in BR.

And as this is a pretty niche plugin I'm also wondering: the tendency in
the js ecosystem is to use npm for everything. If you look at the
install instructions it's for most packets "do npm -i packagename".
So with the fast pace the js world is going I would be really surprised
if anybody would still use packages that haven't been updated for 5+ years.

I have myself a jquery application on my BR target. But i just deploy
jquery with the rest of my application package.

So we should maybe just drop most of the jquery-* packages. (jquery
itself might be useful though)

Regards,
Michael

[0] https://github.com/xdan/datetimepicker/commits/master
[1]
https://www.npmjs.com/package/jquery-datetimepicker?activeTab=dependencies
