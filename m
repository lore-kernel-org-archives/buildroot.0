From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 13 Jul 2015 13:42:39 +0200
Subject: [Buildroot] [PATCH 1/2 v4] core/skeleton: drop /etc/securetty
In-Reply-To: <20150713104618.GO2451@tarshish>
References: <cover.1436778228.git.yann.morin.1998@free.fr>
 <51509ea07660728b4f5aa519d67b6577bd4c9dd4.1436778228.git.yann.morin.1998@free.fr>
 <20150713092051.GK2451@tarshish> <20150713093552.GH4008@free.fr>
 <20150713094433.GL2451@tarshish> <20150713103735.GI4008@free.fr>
 <20150713104618.GO2451@tarshish>
Message-ID: <55A3A42F.50104@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/13/15 12:46, Baruch Siach wrote:
> Hi Yann,
> 
> On Mon, Jul 13, 2015 at 12:37:35PM +0200, Yann E. MORIN wrote:
>> On 2015-07-13 12:44 +0300, Baruch Siach spake thusly:
>>> It would still break overlays with /etc/securetty (maybe locally 
>>> modified). Why not just disable Busybox FEATURE_SECURETTY?
>>
>> After discussing this with Thomas, we've decided to keep it, especially
>> to keep the case you mention (custom securetty from overlay) is still
>> working as expected.
>>
>> The reasoning is that a user which installs a custom /etc/securetty will
>> obviously have it contain the ttys he wants root to log in from, so he'd
>> still be able to log in as root from those ttys.
>>
>> But if we were to remove FEATURE_SECURETTY, then he'd still be able to
>> log in as root from those ttys, but *also* from *any other* tty, and
>> would probably not notice that change as this is a silent change.
>>
>> So, we've concluded that we should keep FEATURE_SECURETTY since it works
>> for our new use-case, and works for existing use-cases.
> 
> Makes sense. Thanks for the explanation.

 Thanks for paying attention to these things as well. Even when there's six of
us together here, we are still vulnerable to group think and may miss things
that way. So an external pair of eyes is definitely good!

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
