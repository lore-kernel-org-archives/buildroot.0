From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 24 Jun 2014 18:31:30 +0200
Subject: [Buildroot] [RFCv1 0/4] Generating a graph of the size
 installed by each package
In-Reply-To: <53A977B4.70205@lucaceresoli.net>
References: <1402177567-8021-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <53A977B4.70205@lucaceresoli.net>
Message-ID: <53A9A7E2.7040906@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/06/14 15:05, Luca Ceresoli wrote:
[snip]
>> The implementation consists in adding a global instrumentation hook
>> that registers which files are installed by each package. A limitation
>> of the current implementation is that when a file is installed by a
>> package A and then overriden by package B, the mechanism will assume
>> the file was installed by package A. Suggestions to welcome on how to
>> solve this in a reasonably simple way.
> 
> It's very well possible that I'm missing something, but I don't get why
> you need to save the list of all installed files.
> 
> Can't you just save the whole rootfs size before and after installation?
> It can be simply computer by 'du -bs $(TARGET_DIR)', and it's way
> easier to parse later. It would also take into account the change of
> size for overwritten files, for free.
> 
> Of course your approach collects more information, but I don't see
> these extra info used in the final graph.

 The reason is explained a bit further in that cover letter: we only do
stripping and removing of redundant stuff in the finalize step, so calculating
the size before that doesn't make much sense.

 The alternative of repeating the finalize step after each package doesn't sound
very attractive either.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
