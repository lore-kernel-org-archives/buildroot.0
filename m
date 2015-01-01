From: Ernest L Williams <ernesto@slac.stanford.edu>
Date: Thu, 1 Jan 2015 09:41:04 -0800
Subject: [Buildroot] Newbie: git send-email Fails: 5.7.3 Authentication
	unsuccessful
Message-ID: <54A586B0.80100@slac.stanford.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am having trouble getting the git-email to work.
Any ideas why Authentication fails?

====== My configuration =========================
git config --global sendemail.smtpuser ernesto at slac.stanford.edu
git config --global sendemail.smtpserver email.slac.stanford.edu
git config --global sendemail.smtpencryption tls
git config --global sendemail.smtpserverport 587


== Snippets from Debug output ===============================
Send this email? ([y]es|[n]o|[q]uit|[a]ll): y
Net::SMTP>>> Net::SMTP(2.31)
Net::SMTP>>>   Net::Cmd(2.29)
Net::SMTP>>>     Exporter(5.70)
Net::SMTP>>>   IO::Socket::INET(1.33)
Net::SMTP>>>     IO::Socket(1.36)
Net::SMTP>>>       IO::Handle(1.34)
Net::SMTP=GLOB(0x2865cd8)<<< 220 email.slac.stanford.edu Microsoft ESMTP 
MAIL Service ready@Thu, 1 Jan 2015 09:32:29 -0800
Net::SMTP=GLOB(0x2865cd8)>>> EHLO localhost.net
Net::SMTP=GLOB(0x2865cd8)<<< 250-email.slac.stanford.edu Hello 
[134.79.121.132]
Net::SMTP=GLOB(0x2865cd8)<<< 250-SIZE 36700160
Net::SMTP=GLOB(0x2865cd8)<<< 250-PIPELINING
Net::SMTP=GLOB(0x2865cd8)<<< 250-DSN
Net::SMTP=GLOB(0x2865cd8)<<< 250-ENHANCEDSTATUSCODES
Net::SMTP=GLOB(0x2865cd8)<<< 250-STARTTLS
Net::SMTP=GLOB(0x2865cd8)<<< 250-AUTH GSSAPI NTLM
Net::SMTP=GLOB(0x2865cd8)<<< 250-8BITMIME
Net::SMTP=GLOB(0x2865cd8)<<< 250-BINARYMIME
Net::SMTP=GLOB(0x2865cd8)<<< 250 CHUNKING
Net::SMTP=GLOB(0x2865cd8)>>> STARTTLS
*
*
*
Net::SMTP::SSL=GLOB(0x2865cd8)<<< 334 GSSAPI supported
Net::SMTP::SSL=GLOB(0x2865cd8)>>>
Net::SMTP::SSL=GLOB(0x2865cd8)<<< 535 5.7.3 Authentication unsuccessful
5.7.3 Authentication unsuccessful
========================

My Thunderbird email client works fine.
