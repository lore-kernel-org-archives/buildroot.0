From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 02 Feb 2021 18:58:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/dhcpcd: create /var/db/dhcpcd
In-Reply-To: <CAPi7W82+Mq6STtt8N+U_HKmFU8f9zZbZof5DSseQ-Jk2Q5bbFw@mail.gmail.com>
 (Fabrice Fontaine's message of "Tue, 2 Feb 2021 18:03:15 +0100")
References: <20210201192420.1028680-1-fontaine.fabrice@gmail.com>
 <87r1lyiikr.fsf@dell.be.48ers.dk>
 <CAPi7W82+Mq6STtt8N+U_HKmFU8f9zZbZof5DSseQ-Jk2Q5bbFw@mail.gmail.com>
Message-ID: <87a6smic6i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Le mar. 2 f?vr. 2021 ? 16:40, Peter Korsgaard <peter@korsgaard.com> a ?crit :
 >> 
 >> >>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
 >> 
 >> > Fixes:
 >> >  - https://bugs.buildroot.org/show_bug.cgi?id=13506
 >> 
 >> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> > ---
 >> >  package/dhcpcd/dhcpcd.mk | 1 +
 >> >  1 file changed, 1 insertion(+)
 >> 
 >> > diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
 >> > index cb269f1138..81e87369ad 100644
 >> > --- a/package/dhcpcd/dhcpcd.mk
 >> > +++ b/package/dhcpcd/dhcpcd.mk
 >> > @@ -46,6 +46,7 @@ endef
 >> 
 >> >  define DHCPCD_INSTALL_TARGET_CMDS
 >> >      $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install DESTDIR=$(TARGET_DIR)
 >> > +    mkdir -p $(TARGET_DIR)/var/db/dhcpcd
 >> 
 >> What is stored here? Does it need to persist over reboots? How should a
 >> readonly rootfs be handled? Could we perhaps make it a symlink to /run
 >> or similar?
 > I'll set this patch as "not applicable" as dhcpcd installs back this
 > directory since version 9.2.0 and
 > https://github.com/rsmarples/dhcpcd/commit/4d695e1ca3b87b45d5e5fa5119ddcb8a086ca9a0

Ok, so we would only need it for 2020.02.x / 2020.11.x then. I'll add it
now.

-- 
Bye, Peter Korsgaard
