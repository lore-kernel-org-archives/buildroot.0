From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 03 Oct 2014 16:12:24 +0200
Subject: [Buildroot] [PATCH 1/2] package/dovecot: New package
References: <1411925137-11284-1-git-send-email-bernd.kuhls@t-online.de>
 <20140929191314.36b87a70@free-electrons.com>
Message-ID: <XnsA3BBA4DC32915berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20140929191314.36b87a70 at free-
electrons.com:

>> +DOVECOT_CONF_OPT = \
>> +     --with-dovecot=/usr/lib \
>> +     --without-dovecot-install-dirs \
>> +     --libexecdir=/usr/bin/dovecot \
> 
> This looks weird. You really want /usr/bin/dovecot as a lib directory?
> Shouldn't this be /usr/lib/dovecot instead?

$libexecdir contains binary files, not libs

$ ls -la usr/libexec/
insgesamt 5384
drwxrwxr-x 2 fli4l fli4l    4096 Okt  3 15:07 .
drwxrwxr-x 8 fli4l fli4l    4096 Okt  3 15:07 ..
-rwxr-xr-x 1 fli4l fli4l   45472 Okt  3 15:07 aggregator
-rwxr-xr-x 1 fli4l fli4l   46046 Okt  3 15:07 anvil
-rwxr-xr-x 1 fli4l fli4l 1073617 Okt  3 15:07 auth
-rwxr-xr-x 1 fli4l fli4l   13026 Okt  3 15:07 checkpassword-reply
-rwxr-xr-x 1 fli4l fli4l  216800 Okt  3 15:07 config
-rwxr-xr-x 1 fli4l fli4l    2839 Okt  3 15:07 decode2text.sh
lrwxrwxrwx 1 fli4l fli4l      11 Okt  3 15:07 deliver -> dovecot-lda
-rwxr-xr-x 1 fli4l fli4l  167149 Okt  3 15:07 dict
-rwxr-xr-x 1 fli4l fli4l  213021 Okt  3 15:07 director
-rwxr-xr-x 1 fli4l fli4l   20330 Okt  3 15:07 dns-client
-rwxr-xr-x 1 fli4l fli4l 1016161 Okt  3 15:07 doveadm-server
-rwxr-xr-x 1 fli4l fli4l   71817 Okt  3 15:07 dovecot-lda
-rwxr-xr-x 1 fli4l fli4l   11762 Okt  3 15:07 gdbhelper
-rwxr-xr-x 1 fli4l fli4l  931236 Okt  3 15:07 imap
-rwxr-xr-x 1 fli4l fli4l   73946 Okt  3 15:07 imap-login
-rwxr-xr-x 1 fli4l fli4l   46435 Okt  3 15:07 imap-urlauth
-rwxr-xr-x 1 fli4l fli4l   26963 Okt  3 15:07 imap-urlauth-login
-rwxr-xr-x 1 fli4l fli4l  129652 Okt  3 15:07 imap-urlauth-worker
-rwxr-xr-x 1 fli4l fli4l   65959 Okt  3 15:07 indexer
-rwxr-xr-x 1 fli4l fli4l   69629 Okt  3 15:07 indexer-worker
-rwxr-xr-x 1 fli4l fli4l   46971 Okt  3 15:07 ipc
-rwxr-xr-x 1 fli4l fli4l  158678 Okt  3 15:07 lmtp
-rwxr-xr-x 1 fli4l fli4l   47096 Okt  3 15:07 log
-rwxr-xr-x 1 fli4l fli4l   16133 Okt  3 15:07 maildirlock
-rwxr-xr-x 1 fli4l fli4l  122073 Okt  3 15:07 pop3
-rwxr-xr-x 1 fli4l fli4l   56652 Okt  3 15:07 pop3-login
-rwxr-xr-x 1 fli4l fli4l  384370 Okt  3 15:07 quota-status
-rwxr-xr-x 1 fli4l fli4l   28107 Okt  3 15:07 rawlog
-rwxr-xr-x 1 fli4l fli4l   94576 Okt  3 15:07 replicator
-rwxr-xr-x 1 fli4l fli4l   22063 Okt  3 15:07 script
-rwxr-xr-x 1 fli4l fli4l   22352 Okt  3 15:07 script-login
-rwxr-xr-x 1 fli4l fli4l   43799 Okt  3 15:07 ssl-params
-rwxr-xr-x 1 fli4l fli4l  130070 Okt  3 15:07 stats
-rwxr-xr-x 1 fli4l fli4l   27626 Okt  3 15:07 xml2text

Nonetheless I removed that and similar options from the package so it 
installs all files to their default paths. Locally I need other paths, 
their options are part of v1 of this patch and will be removed in v2, I 
will keep my adjustments in a private patch.

> dovecot-config is in $(STAGING_DIR)/usr/lib ? This looks weird.

Correct, thats the default path for this file.

Regards, Bernd
