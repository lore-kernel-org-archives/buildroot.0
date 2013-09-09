From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 9 Sep 2013 10:41:53 +0200
Subject: [Buildroot] [PATCH 1/1] aiccu: new package
In-Reply-To: <259F47B1-05A5-4383-9D2C-D807B148BDBE@layer-7.net>
References: <1378418213-22160-1-git-send-email-rommel@layer-7.net>
 <CAAXf6LXZnoX6u1fUD_2HX108_-6JnWaBFowV-yzLxsaeDOfFJA@mail.gmail.com>
 <150C0AB5-B4C6-4379-9FEE-9819278AAF69@layer-7.net>
 <CAAXf6LWetaF-1wTWvhad-gKFc0CwLrqTKjgM_F9Seou+Pm=UWg@mail.gmail.com>
 <E86404F6-302E-4A10-9828-19607F8DC0AD@layer-7.net>
 <CAAXf6LUEqQKuSz2oCyJHcM-=BeY3e-hjPa0fKk7=F8m=E8Es+g@mail.gmail.com>
 <259F47B1-05A5-4383-9D2C-D807B148BDBE@layer-7.net>
Message-ID: <CAAXf6LXi89Om52mo5kZaP5GqBUej-MPzJFEHmhS+_MHFHkQoRQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Sep 8, 2013 at 8:28 PM, Michael Rommel <rommel@layer-7.net> wrote:
> Hi,
>
> thanks for your help!
>
> On Sep 8, 2013, at 19:46 , Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:
>
>>
>> Here are some questions to try understand the problem:
>> - how long have you been subscribed to the buildroot mailing list, and
>> have you ever received mails from the list (when you weren't directly
>> in copy)?
>
>
> June: 1001 messages,
> July: 1539 messages
> August: 1177 messages
> September: 482 messages
>
> My procmail log file says:
> root at ns1:/export/users/rommel# tail -350 ~rommel/mail/procmail/procmail.log |grep buildroot-bounces
> From buildroot-bounces at busybox.net  Fri Sep  6 16:34:16 2013
> From buildroot-bounces at busybox.net  Fri Sep  6 16:36:04 2013
> From buildroot-bounces at busybox.net  Fri Sep  6 16:39:11 2013
> From buildroot-bounces at busybox.net  Fri Sep  6 17:27:24 2013
> From buildroot-bounces at busybox.net  Fri Sep  6 17:28:07 2013
> From buildroot-bounces at busybox.net  Fri Sep  6 17:28:15 2013
> From buildroot-bounces at busybox.net  Fri Sep  6 17:53:57 2013
> From buildroot-bounces at busybox.net  Fri Sep  6 17:56:15 2013
> From buildroot-bounces at busybox.net  Fri Sep  6 18:06:09 2013
> From buildroot-bounces at busybox.net  Fri Sep  6 18:36:17 2013
> From buildroot-bounces at busybox.net  Fri Sep  6 18:36:22 2013
> From buildroot-bounces at busybox.net  Fri Sep  6 19:45:42 2013
> From buildroot-bounces at busybox.net  Fri Sep  6 19:49:15 2013
> From buildroot-bounces at busybox.net  Fri Sep  6 19:56:17 2013
> From buildroot-bounces at busybox.net  Fri Sep  6 20:07:52 2013
> From buildroot-bounces at busybox.net  Fri Sep  6 20:45:21 2013
> From buildroot-bounces at busybox.net  Fri Sep  6 22:25:25 2013
> From buildroot-bounces at busybox.net  Fri Sep  6 22:27:27 2013
> From buildroot-bounces at busybox.net  Fri Sep  6 22:54:14 2013
> From buildroot-bounces at busybox.net  Fri Sep  6 23:36:34 2013
>
> It suddenly stops at that point in time.
>
>
>> - is there a spam/junk folder you can check for any lost mails. Is
>> there possibly a corporate filter that could block things?
>
> The procmail sorts the mails from the buildroot mailing list in a different folder and
> they do not go through the spamfilter.
>
>> - are you subscribed to other mailing lists, and are you having any
>> problems with these?
>
> I am not on any other mailing lists.
>
>> - I guess you are still subscribed to the list as you can send mail to
>> it. So you must have received a confirmation mail about that too, with
>> a password (or maybe you have chosen one yourself). You probably can
>> also log into the subscriber page at:
>> http://lists.busybox.net/mailman/listinfo/buildroot
>> The last form, where you enter your e-mail address, is the one you
>> want. You should get a page where you can set your name, and choose
>> some other options.
>
> I can log into this webinterface and see the options.
>
>> In general, I'm more thinking towards a problem at your end than on
>> the list. I haven't heard about problems with other subscribers
>> before.
>
> Well the fact that I can still send and receive e-mails from all over the world seems to indicate that the general setup is okay.
>
> What wondered me is, that really the mailserver itself does not even receive a connection from buildroot!
> These are the last entries on the postfix:
>
> root at ns1:/var/log# grep buildroot mail.log.1
> Sep  6 20:45:21 ns1 postgrey[805]: action=pass, reason=triplet found, client_name=whitealder.osuosl.org, client_address=140.211.166.138, sender=buildroot-bounces at busybox.net, recipient=rommel at layer-7.net
> Sep  6 20:45:21 ns1 postfix/qmgr[500]: 4A5F31FFF4: from=<buildroot-bounces@busybox.net>, size=18060, nrcpt=1 (queue active)
> Sep  6 22:25:25 ns1 postgrey[805]: action=pass, reason=triplet found, client_name=silver.osuosl.org, client_address=140.211.166.136, sender=buildroot-bounces at busybox.net, recipient=rommel at layer-7.net
> Sep  6 22:25:25 ns1 postfix/qmgr[500]: 92704202C8: from=<buildroot-bounces@busybox.net>, size=10288, nrcpt=1 (queue active)
> Sep  6 22:27:27 ns1 postgrey[805]: action=pass, reason=triplet found, client_name=hemlock.osuosl.org, client_address=140.211.166.133, sender=buildroot-bounces at busybox.net, recipient=rommel at layer-7.net
> Sep  6 22:27:27 ns1 postfix/qmgr[500]: 76A4F202C8: from=<buildroot-bounces@busybox.net>, size=6662, nrcpt=1 (queue active)
> Sep  6 22:54:14 ns1 postgrey[805]: action=pass, reason=triplet found, client_name=fraxinus.osuosl.org, client_address=140.211.166.137, sender=buildroot-bounces at busybox.net, recipient=rommel at layer-7.net
> Sep  6 22:54:14 ns1 postfix/qmgr[500]: 9236F1FFF4: from=<buildroot-bounces@busybox.net>, size=5519, nrcpt=1 (queue active)
> Sep  6 23:36:33 ns1 postgrey[805]: action=pass, reason=triplet found, client_name=hemlock.osuosl.org, client_address=140.211.166.133, sender=buildroot-bounces at busybox.net, recipient=rommel at layer-7.net
> Sep  6 23:36:34 ns1 postfix/qmgr[500]: 0141C1FEB4: from=<buildroot-bounces@busybox.net>, size=6758, nrcpt=1 (queue active)
>
> And we have routed about 400 mail through the server today.
>
>
>> The list administrator is Peter Korsgaard (the maintainer of
>> buildroot). If you feel there is a problem on the list side, you could
>> contact him to see if he can find out more...
>
>
> Since he is reading the mailing list and it seems that I can still send to the list, I refrain from mailing him separately - Peter, if you can see what's wrong with my address, I would be glad to know. I wonder if there is some kind of blacklist or blocker involved here. Our mailserver here is:
>
> ;; QUESTION SECTION:
> ;layer-7.net.                   IN      MX
>
> ;; ANSWER SECTION:
> layer-7.net.            86400   IN      MX      20 smtp.tschaeche.com.
>
> ;; ANSWER SECTION:
> smtp.tschaeche.com.     84097   IN      A       188.40.196.194
> smtp.tschaeche.com.     86400   IN      MX      30 smtp.tschaeche.com.
> smtp.tschaeche.com.     86400   IN      MX      40 ns1.tschaeche.com.
>

>

Hmm, I also seem to be missing some mails now, with a standard gmail account.
