From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 23 Jul 2017 02:13:27 +0200
Subject: [Buildroot] [PATCH 16/20] system: separate sysv and systemd
 parts of the skeleton
In-Reply-To: <430c46f8-bb5d-a2bf-3695-6822609e0a2c@mind.be>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <f797589346d85a6ebba86bb418d6b818051d0da7.1500398733.git.yann.morin.1998@free.fr>
 <430c46f8-bb5d-a2bf-3695-6822609e0a2c@mind.be>
Message-ID: <75f5daaf-c750-3f24-670e-ab470d845b16@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-07-17 02:08, Arnout Vandecappelle wrote:
> 
> On 18-07-17 19:25, Yann E. MORIN wrote:
>> systems does not like that the content of /var be symlinks to /tmp,
>   systemd
> 
>> especially journald that starts before /tmp is mounted, and thus the
>> journal files are hidden from view, which causes wuite a bit if fuss...
>                                                    quite
>> Instead, move the current /var to a sysv-only skeleton.
>>
>> systemd at install time will create the /var content it needs, so we
>  I guess systemd will also create a tmpfs on /var?

 Seems the following sentence got dropped:

What happens when a package installs something in /var?


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
