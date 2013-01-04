From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Jan 2013 17:29:45 +0100
Subject: [Buildroot] [PATCH] divine: fix divine-config
In-Reply-To: <CAHXCMMKhDpanjesHYjMSh-dcAHKt-84B3gEgyzs6UgN_8VRZvQ@mail.gmail.com>
References: <1357250947-23296-1-git-send-email-stefan.froberg@petroprogram.com>
 <50E6BFE2.2090405@zacarias.com.ar>
 <CAHXCMMKhDpanjesHYjMSh-dcAHKt-84B3gEgyzs6UgN_8VRZvQ@mail.gmail.com>
Message-ID: <20130104172945.50d8efd8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Fri, 4 Jan 2013 15:17:42 +0100, Samuel Martin wrote:

> We quickly talked about this during the last Buildroot Dev. Days.
> 
> IIRC, Thomas and Peter were not very fond of this kind of solution.
> (guys, feel free to correct me if I speak with my ass ;)).

I might remember wrong, but I think the solution I did not like was
blindly patching *ALL* the files matching *-config.

The solution proposed by Gustavo, where the foo-config files to be
patched are explicitly listed in a package variable sounds fine to me,
as long as the common thing is only to patch prefix and exec_prefix,
the other more specialized fixes (if any) have to be left to the
package specific .mk file.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
