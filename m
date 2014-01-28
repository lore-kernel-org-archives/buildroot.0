From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 Jan 2014 07:54:53 +0100
Subject: [Buildroot] [PATCH 1/1] Prefer 'command -v' over 'which' (for
 portability)
In-Reply-To: <CAHXCMMKE-WDNCTQ82uuEM5n=t4Ua=qTDTTaBxQ7=wVgiBejd0w@mail.gmail.com>
References: <1390659116-18865-1-git-send-email-bjorn.forsman@gmail.com>
 <CAHXCMMKE-WDNCTQ82uuEM5n=t4Ua=qTDTTaBxQ7=wVgiBejd0w@mail.gmail.com>
Message-ID: <52E7543D.9010103@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27/01/14 10:19, Samuel Martin wrote:
> "command -v" seems not playing very well with aliases:
>
> $ command -v make
> alias make='~/.config/ctafconf/bin/colorwarper make'
> $ which make
> /usr/bin/make

  I don't think your .profile gets executed when running a shell script, 
so the alias will not be set. Bash does use BASH_ENV to specify a startup 
script, so perhaps we should unexport that.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
