From: Waldemar Axt <exilit.w@gmail.com>
Date: Tue, 10 Mar 2015 16:51:20 +0100
Subject: [Buildroot] Migrate Buildroot based Eclipse project
Message-ID: <CAL41q9u8_a1M9+RdFy0GaDcffoW8Hbd+zOEYt3GDRZg0VWnrqA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I am working on a project for an embedded Linux device based on Buildroot.

The project sources and the Buildroot sources/Framework are maintained and
version controlled inside the same GIT repository.
The sources are managed as Eclipse projects using the Buildroot plugin.

So far everything works fine, but there is one big problem with this
configuration, I am not able to solve. If the GIT repository
(containing all the source code and Buildroot ...) is cloned by someone
else, also the eclipse project settings
(.project, .cproject) are cloned (intentionally, as I don't want to force
everyone to setup the whole project settings) are cloned.

My understanding of the whole Eclipse plugin thing is, that it sets up the
Buildroot specific paths for the projects. But as it turns out,
it doesn't. The '.cproject' contains many setup/system specific entries.
More specifically, the paths to the toolchain
(Buildroot built-in toolchain) are included and many ids have user specific
informations included. They seem to reflect the
paths on the system somehow. If the Buildroot toolchain lies in

                * "/home/user/projectX/Buildroot/output/host/usr/bin" *

for example, then the ids are something like

                *
"org.buildroot.home.user.projectX.buildroot.output......".*


So what is an appropriate way to setup such a project structure? I have no
Idea how to keep the project settings portable.

Thank you in advance.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150310/b0c24026/attachment.html>
