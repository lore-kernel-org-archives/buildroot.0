From: Carlos Santos <casantos@datacom.com.br>
Date: Mon, 18 Jun 2018 08:48:44 -0300 (BRT)
Subject: [Buildroot] customizations to package recipes in BR2_EXTERNAL?
In-Reply-To: <4428F9BB-DCBB-42D1-AA6E-EFBE83730FD9@stask.net>
References: <4428F9BB-DCBB-42D1-AA6E-EFBE83730FD9@stask.net>
Message-ID: <1150144198.1192053.1529322524893.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Liam Staskawicz" <liam@stask.net>
> To: "buildroot" <buildroot@busybox.net>
> Sent: Sunday, June 17, 2018 6:30:14 PM
> Subject: [Buildroot] customizations to package recipes in BR2_EXTERNAL?

> Hello,
> 
> I'd like to slightly modify an existing package (nvidia-driver) to target a
> different version (not the latest version, just the specific version my project
> is using). The changes are simple - updating the version string, and .hash
> entries - but it's not clear how best to manage these changes in a BR2_EXTERNAL
> based workflow, as patches in BR2_GLOBAL_PATCH_DIR get applied after the
> sources have been downloaded and unpacked.
> 
> I'd like to avoid maintaining a clone of the buildroot repo with these changes,
> if possible. Is there a recommended workflow for this situation?
> 
> Thanks,
> Liam

Allowing users to customize existing packages in a BR2_EXTERNAL could
lead to unpredictable results. If you need a custom nvidia-driver then
copy/edit the original package definition to <my-project>-nvidia-driver
in your BR2_EXTERNAL. That's quite easy, since no other package depends
on nvidia-driver.

A more generic solution would be allowing the user to select the desired
version by means of a sub-menu. This seems to make sense for a package
that install pre-compiled binaries, like nvidia-driver does.

Let's ask the opinion of the package maintainers (in CC).

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
