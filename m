From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Date: Wed, 16 Sep 2020 09:42:00 +0200
Subject: [Buildroot] [PATCH v2 2/3] package/meson: use specific BR
 variables for cross-compilation.conf
In-Reply-To: <20200915225036.7e858a1e@windsurf.hq.k.grp>
References: <20200915100546.806157-1-nolange79@gmail.com>
 <20200915100546.806157-2-nolange79@gmail.com>
 <e03b2581-ce33-25a5-2c35-5145d4f0dd1a@green-communications.fr>
 <CADYdroOFr0KdVKspvj28ERrFShHv28zHzsmQuwo7EPhm9NsdxQ@mail.gmail.com>
 <20200915225036.7e858a1e@windsurf.hq.k.grp>
Message-ID: <e4a5fcea-0f59-5fbc-4150-98dbbe005b79@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/09/2020 22:50, Thomas Petazzoni wrote:
> On Tue, 15 Sep 2020 17:46:18 +0200
> Norbert Lange <nolange79@gmail.com> wrote:
> 
>>> This changes host/bin/pkgconf to host/bin/pkg-config, but that shouldn't
>>> be a problem, given meson only uses this pkgconfig to find target
>>> packages and not host packages (for that meson would look it up in a
>>> native-file instead of a cross-file).  
>>
>> Well, its used by all other build systems, so this makes more sense to me,
>> otherwise, shouldn't PKG_CONFIG_HOST_BINARY be changed to pkgconfig?
> 
> No, for Meson things are special, and it should really point to pkgconf
> directly, and not to Buildroot's pkg-config wrapper around pkgconf.
> 
> Otherwise, what you're doing essentially reverts
> 4e0bc29993376613d200e892d491e31ea5a49622.

We have already established that 4e0bc299 doesn't work:

https://marc.info/?l=buildroot&m=158853516017526&w=2

And i can confirm that the situation hasn't changed in 2020.08, the logs from my
first message in this thread are unchanged in 2020.08
https://marc.info/?l=buildroot&m=158849499805939&w=2

but this is probably another topic.
