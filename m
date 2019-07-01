From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 2 Jul 2019 00:26:44 +0200
Subject: [Buildroot] [PATCH 19/27] autobuild-run: define output
 directory as part of Builder class
In-Reply-To: <20190629050214.17852-19-itsatharva@gmail.com>
References: <20190629050214.17852-1-itsatharva@gmail.com>
 <20190629050214.17852-19-itsatharva@gmail.com>
Message-ID: <24bbb942-be3e-0892-35f1-2e4af0b93424@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29/06/2019 07:02, Atharva Lele wrote:
> Absolute path for output dir is required when using outputdir with
> system commands like make or tail. It was necessary because the
> relative path would be relative to the autobuilder script rather
> than the buildroot source directory.
> 
> It is OK to use absolute path even where it was not used before
> since Python throws away the non-absolute components and uses
> the absolute path for os.path.join() wherever it is used.

 This is not really accurate. It is OK to use an absolute path everywhere since
an absolute path is always correct, nothing more than that. The rest of the
sentence is inaccurate.

> 
> Signed-off-by: Atharva Lele <itsatharva@gmail.com>

[snip]
> @@ -472,9 +468,8 @@ class Builder:
>          monitor_thread_hung_build_flag = Event()
>          monitor_thread_stop_flag = Event()
>          build_monitor = Thread(target=self.stop_on_build_hang,
> -                               args=(monitor_thread_hung_build_flag,
> -                                     monitor_thread_stop_flag,
> -                                     sub, outputdir))
> +                            args=(monitor_thread_hung_build_flag,
> +                                  monitor_thread_stop_flag, sub))

 Here you introduced a whitespace error.

 Regards,
 Arnout

[snip]
