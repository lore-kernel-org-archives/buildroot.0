From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 20 Jul 2016 08:20:40 +0300
Subject: [Buildroot] how to add UART1,2,3 on beaglebone
In-Reply-To: <e53c5a20-dc1d-3fda-0dfd-9e46c8f98185@gmail.com>
References: <e53c5a20-dc1d-3fda-0dfd-9e46c8f98185@gmail.com>
Message-ID: <20160720052040.GA3766@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jehun Lee,

On Tue, Jul 19, 2016 at 09:07:26PM -0700, Jehun Lee wrote:
> I made and load successfully on my beaglebone black by following docs on
> https://buildroot.org/docs.html.
> But that image has only one ttyO0 for console. I want to add UART1,2,3 of
> beaglebone black.
> How can I do that? Any advice?

You need to add getty entries in your target /etc/inittab file. Look for 
'ttyO0' in /etc/inittab, and add similar entries for ttyO{1,2,3}.

This assumes that you are using either Busybox init (most likely) or sysvinit. 
If you use systemd, add a symlink in /etc/systemd/system/getty.target.wants/ 
for each console.

Hope this helps,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
