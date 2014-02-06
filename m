From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 06 Feb 2014 18:16:09 +0100
Subject: [Buildroot] [pkg-perl infra V4 9/9] qemu: add a Config.in.host
In-Reply-To: <CAB0FRsswiwUhbho2EU-kTh1ASYYvq+_wHFtojKvfwUL92c85+g@mail.gmail.com>
References: <1391608380-23240-1-git-send-email-francois.perrad@gadz.org>
 <1391608380-23240-10-git-send-email-francois.perrad@gadz.org>
 <20140205170456.2440f114@skate>
 <CAB0FRsswiwUhbho2EU-kTh1ASYYvq+_wHFtojKvfwUL92c85+g@mail.gmail.com>
Message-ID: <52F3C359.9040705@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/02/14 20:48, Fran?ois Perrad wrote:
> 2014-02-05 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
>> > Dear Francois Perrad,
>> >
>> > On Wed,  5 Feb 2014 14:53:00 +0100, Francois Perrad wrote:
>>> >> after the removal of cpanminus
>>> >>
>>> >> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>>> >> ---
>>> >>  package/Config.in.host      |    1 +
>>> >>  package/qemu/Config.in.host |   10 ++++++++++
>>> >>  2 files changed, 11 insertions(+)
>>> >>  create mode 100644 package/qemu/Config.in.host
>> >
>> > I'm not sure this should be part of the Perl patch series. At the
>> > meeting, I think we all agreed that building the Qemu user-mode
>> > emulation for the host is not useful as it cannot work properly.
>> > Instead the qemu package should build the system-mode emulation for the
>> > host, which is something that Gustavo proposed some time ago.
>> >
>> > So I'd say to leave Qemu on the side for now, and focus on the Perl
>> > side of things in this patch series.
>> >
> Frank Hunleth needs it.
> See http://lists.busybox.net/pipermail/buildroot/2013-December/084131.html
> & http://patchwork.ozlabs.org/patch/299014/

 It's true that qemu-user would be nice to have, but unless we can find a
way to guarantee that it works, I'm also against keeping it. When the
kernel version is inconsistent, it can really break in hard to debug ways.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
