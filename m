From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Feb 2014 07:48:37 +0100
Subject: [Buildroot] [PATCH 3/4] samba: convert to choice package
In-Reply-To: <1391806354-32698-4-git-send-email-gustavo@zacarias.com.ar>
References: <1391806354-32698-1-git-send-email-gustavo@zacarias.com.ar>
 <1391806354-32698-4-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <52F87645.8000708@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/07/14 21:52, Gustavo Zacarias wrote:
> Convert the classic samba package to a choice and move it to samba3 in
> preparation for the samba4 package.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

 I don't like this rename. Why not keep the old samba package and add
samba4 to it? If side-by-side installation is not possible, make samba4
depend on !samba, like is done for qt5.

 If you do keep this rename, there are a few things you forgot:

- gvfs has a condition on BR2_PACKAGE_SAMBA_LIBSMBCLIENT;

- you need legacy options for all the samba suboptions.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
