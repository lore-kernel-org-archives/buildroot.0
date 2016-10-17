From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Oct 2016 22:30:22 +0200
Subject: [Buildroot] [PATCH 2/8] adwaita-icon-theme: install to staging
In-Reply-To: <5ff81c29-dec0-4e89-0232-18f16d1068e1@zacarias.com.ar>
References: <1476321239-13894-1-git-send-email-gustavo@zacarias.com.ar>
 <1476321239-13894-2-git-send-email-gustavo@zacarias.com.ar>
 <20161016181520.4f8b4ea1@free-electrons.com>
 <5ff81c29-dec0-4e89-0232-18f16d1068e1@zacarias.com.ar>
Message-ID: <60ae2d27-8c3c-8ec5-6524-9c1aecc4ee3e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17-10-16 12:08, Gustavo Zacarias wrote:
> On 16/10/16 13:15, Thomas Petazzoni wrote:
> 
>> Hello,
>>
>> On Wed, 12 Oct 2016 22:13:53 -0300, Gustavo Zacarias wrote:
>>> This is required for the upcoming evince package.
>>>
>>> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
>>> ---
>>>  package/adwaita-icon-theme/adwaita-icon-theme.mk | 1 +
>>>  1 file changed, 1 insertion(+)
>>
>> It feels a bit odd that evince needs icons in the staging directory.
>> Could you improve the commit message a bit to explain why this is
>> needed?
>>
>> Thanks!
>>
>> Thomas
> 
> Hi.
> It's actually very simple, evince checks for adwaita icons via pkgconfig, hence 
> if they're not installed in staging they're not found.

 I indeed thought something like that, but then I thought: why bother installing
everything to staging if only the .pc file is needed? However, it is staging, so
we don't really care how much crap is in there, and we do prefer to use the
upstream install commands. So OK for me.

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> Should i resend the series or just this one?

 Normally I'd say: the series. However, we're not going to accept
python-libxml2. The idea is to bite the bullet and add Config.in.host entries
for all host packages, so this type of problem can be properly resolved. We'll
do that gradually. Python and python3 would be good to start with - although
those are already pretty heavy, roughly 50 packages need to be updated to select
BR2_PACKAGE_HOST_PYTHON{,3}).


 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
