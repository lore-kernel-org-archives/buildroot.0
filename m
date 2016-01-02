From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 2 Jan 2016 02:21:46 +0100
Subject: [Buildroot] [PATCH 32/84 RFC] package/gstreamer: include
 plugins from gstreamer's real Config.in
In-Reply-To: <20151231172336.GD3495@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
 <14c33d26a86cb2bb6673d5f053fb871dbfe9b8c8.1451076704.git.yann.morin.1998@free.fr>
 <56847303.4040608@mind.be> <20151231172336.GD3495@free.fr>
Message-ID: <5687262A.3030300@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 31-12-15 18:23, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2015-12-31 01:12 +0100, Arnout Vandecappelle spake thusly:
>> On 25-12-15 22:25, Yann E. MORIN wrote:
>>> It is more logical to have a single if-clause, rather than repeat it in
>>> another file, possiblty brealking indentation like it previously was.
>>
>>  I actually preferred the way it was indented before. Now there is no
>> distinction anymore between the gstreamer options and the additional plugin
>> packages.
> 
> Yes, that is on-purpose. The gstreamer plugins are really "sub-options"
> (in the end-user experience) of gstreamer. That they are in fact
> completely different packages is still irrelevant to him. ;-)

 Well, according to that reasoning the packages should not be shown and instead
only the plug-in list should be there. I don't think we're going to do that.

 The reason I had less of a concern about gstreamer is because here most of them
are in fact pieces of the same project (like kodi, xorg, matchbox, etc). The
others (python, php, ...) are really external plugins. Of course there are also
some "external" plugins here, but even those tend to get absorbed by the
superproject eventually (like what happened with gst-omx for instance).

 Still,

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> 
> Regards,
> Yann E. MORIN.
> 
>> But I don't feel strongly about it.
>>
>>
>>  Regards,
>>  Arnout
>>
[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
