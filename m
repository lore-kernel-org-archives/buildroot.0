From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 04 Feb 2016 14:24:11 +0000
Subject: [Buildroot] [Bug 8651] libMonoPosixHelper.so wrong link reference
 in buildroot image
In-Reply-To: <bug-8651-163@https.bugs.busybox.net/>
References: <bug-8651-163@https.bugs.busybox.net/>
Message-ID: <bug-8651-163-GcQ1HgjCTH@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8651

--- Comment #2 from Markus Egle <Markus.Egle@Qiagen.com> ---
Till now I'm not really familiar with the config/make procedure. 
So I don't know if I have to change the Makefile.in or the config.in or both. 

Found four possible locations to make the testing changes. 


...> find /home/eglem/buildroot -name "*.in"|grep mono|awk '{print "grep -Hn
libMonoPosixHelper " $1}'|sh|grep target

/home/eglem/buildroot/output/build/host-mono-4.0.2.5/runtime/Makefile.in:629:  
sed
's,target="$(prefix)/$(reloc_libdir)/libMonoPosixHelper$(libsuffix)",target="'$$d'/libMonoPosixHelper.la",'
../data/config > $@t
/home/eglem/buildroot/output/build/host-mono-4.0.2.5/data/config.in:13: <dllmap
dll="MonoPosixHelper"
target="@prefix@/@reloc_libdir@/libMonoPosixHelper@libsuffix@" os="!windows" />
/home/eglem/buildroot/output/build/mono-4.0.2.5/runtime/Makefile.in:629:       
sed
's,target="$(prefix)/$(reloc_libdir)/libMonoPosixHelper$(libsuffix)",target="'$$d'/libMonoPosixHelper.la",'
../data/config > $@t
/home/eglem/buildroot/output/build/mono-4.0.2.5/data/config.in:13:      <dllmap
dll="MonoPosixHelper"
target="@prefix@/@reloc_libdir@/libMonoPosixHelper@libsuffix@" os="!windows" />



Then I just remove the prefix?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
