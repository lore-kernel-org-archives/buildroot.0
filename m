From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 Jun 2013 19:39:17 +0200
Subject: [Buildroot] using a variable within a buildroot menuconfig
In-Reply-To: <51C94D88.5080707@gmail.com>
References: <51C94D88.5080707@gmail.com>
Message-ID: <51C9D5C5.4090409@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/06/13 09:58, Jan Pohanka wrote:
> Hi all,
>
> I have another /weird/ question.
>
> I would like to know if it is possible to create an item in configuration
> which will for example contain some (absolute) path on my filesystem.
> Then I would like to use this variable for example in --extra-cflags
> configure option for applications like ffmpeg etc.

  I'm afraid that I don't understand your question. string type 
configuration variables can contain any kind of string, including paths 
of files. This is used for instance in BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE.

  Specifically for ffmpeg, however, there is already the 
BR2_PACKAGE_FFMPEG_EXTRACONF option. You can just set that to
--extra-cflags '-fPIC -DMY_DEFINE' (note the funky quoting, which I'm not 
100% sure will work correctly).

> I know that it is not very nice way, but I need to integrate buildroot
> with Texas Instruments SDK, which is not very GNU build tools friendy.

  I wonder what you mean with the TI SDK. You probably mean you have to 
use _some packages_ that are in the 700MB self-extractor, right? Because 
the SDK itself is in fact a replacement for buildroot (or buildroot is a 
replacement for the SDK, depending on how you want to look at it :-).

  Getting that stuff to work is absolute horror, I can testify. I did 
that a year and a half ago for the DM365 multimedia codecs, but I never 
found a reasonable solution to extract and build individual packages.


  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
