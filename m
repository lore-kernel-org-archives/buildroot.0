From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 31 Jul 2012 16:30:59 +0200
Subject: [Buildroot] [PATCH] less: build after busybox
In-Reply-To: <50126CD8.7010201@zacarias.com.ar>
References: <1343330317-24730-1-git-send-email-gustavo@zacarias.com.ar>
 <CAHXCMM+ORAKWNqQJ34FEZ+AbQ5dfpVuZAF3Y85xz6Wf9pmccmg@mail.gmail.com>
 <50124E38.6040504@mind.be> <50126CD8.7010201@zacarias.com.ar>
Message-ID: <5017EC23.2080001@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/27/12 12:26, Gustavo Zacarias wrote:
> On 07/27/12 05:15, Arnout Vandecappelle wrote:
>
>> >    One alternative could be to automatically deselect less from busybox
>> >  when the full-blown less is selected.  But also that is a bit complex
>> >  I think.
>> >
> I'm not a big fan of that either, it's not buildroot's resposability to
> do effort deduplication.
> With that reasoning should we disable busybox's httpd if
> lighttpd/hiawatha/boa/some other web server is enabled?
> It's a thin line to walk on, lighttpd>  boa so boa should be disabled,
> and things like that...

  There's a big difference: for busybox, people often use the default config,
so the decision to include httpd in unconscious.  boa or lighttpd can only
be selected explicitly.

  The difficulty you mention does exist for libxml2 vs. expat, because those
are often selected automatically.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
