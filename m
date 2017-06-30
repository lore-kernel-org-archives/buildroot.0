From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 30 Jun 2017 17:45:59 +0200
Subject: [Buildroot] question on setting file ownership after boot
In-Reply-To: <CABWt4evLAk_=Nr3ktrPj-NEArjBaicmNkMxAoDk7HNmHe9LSug@mail.gmail.com>
References: <CABWt4evLAk_=Nr3ktrPj-NEArjBaicmNkMxAoDk7HNmHe9LSug@mail.gmail.com>
Message-ID: <46798e49-c7f0-ac8e-5906-6ff898a6b261@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30-06-17 14:55, Robert Smigielski wrote:
> Hi everyone
> 
> I am making customization on my Buildroot created board support package. I know
> there is some method that configures specific ownership of files in the various
> file system directories on boot up. On this embedded board I want root to own
> all the dbus files so I want to specifically set file and directory ownership
> and group membership to root system wide. I cannot recall what file configures
> that. I know that the file system/device_table.txt performs a similar function
> for /dev/* files but what does so for files over in /etc and /usr and so on?

 Indeed, system/device_table.txt performs that function for files and
directories, while system/device_table_dev.txt does it for /dev/* device nodes.
It is called "device_table.txt" for historical reasons, it is currently only
used for permissions, not devices.

 You can configure the file to use with the BR2_ROOTFS_DEVICE_TABLE option
("Path to the permission tables"). You probably want to add a second file to
that (space-separated) with the things you want to change.

 See [1] and [2] for details.

 Regards,
 Arnout

[1] https://buildroot.org/manual.html#customize-device-permission
[2] https://buildroot.org/manual.html#makedev-syntax


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
