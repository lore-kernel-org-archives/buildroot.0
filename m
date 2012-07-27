From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 27 Jul 2012 10:15:52 +0200
Subject: [Buildroot] [PATCH] less: build after busybox
In-Reply-To: <CAHXCMM+ORAKWNqQJ34FEZ+AbQ5dfpVuZAF3Y85xz6Wf9pmccmg@mail.gmail.com>
References: <1343330317-24730-1-git-send-email-gustavo@zacarias.com.ar>
 <CAHXCMM+ORAKWNqQJ34FEZ+AbQ5dfpVuZAF3Y85xz6Wf9pmccmg@mail.gmail.com>
Message-ID: <50124E38.6040504@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/27/12 00:30, Samuel Martin wrote:
>> >  +# Build after busybox, full-blown is better
>> >  +LESS_DEPENDENCIES = ncurses $(if $(BR2_PACKAGE_BUSYBOX),busybox)
> Though I understand why you prefer this one, I somehow don't really
> like it... because it's not about build dependency, but build/install
> order...

  I also don't really like it.  For instance, if you rebuild busybox, this
will not trigger a reinstall of less so it will again be the busybox version
that prevails...

  However, I don't see a better solution than this one.  For sure,
selecting less and getting busybox is worse than this.


  One alternative could be to automatically deselect less from busybox
when the full-blown less is selected.  But also that is a bit complex
I think.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
