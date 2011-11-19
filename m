From: Cam Hutchison <camh@xdna.net>
Date: Sat, 19 Nov 2011 07:13:34 -0000
Subject: [Buildroot] [PATCH 1 of 5 v2] Makefile.package.in: add utility
	functions find*clauses and notfirstword
References: <patchbomb.1321557989@devws108>
 <b6579582d02dd802adca.1321557990@devws108>
Message-ID: <172e.4ec7571e.5a6e@getafix.xdna.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

Apologies if you have seen this, but I haven't seen my response to this
come through (probably a gmane stuffup).

>+# finddirclauses: creates "-wholename 'basedir/dirX' -o -wholename 'basedir/dirY'"
>+# [1:basedir, 2:namelist]
>+finddirclauses=-wholename '$(firstword $(2))' $(patsubst %,-o -wholename '$(1)/%',$(call notfirstword,$(2)))

I think the first -wholename argument is meant to be
  '$(1)/$(firstword $(2))'

according to the comment above it.

Also, my man page for find(1) says this about -wholename:
  See -path.    This alternative is less portable than -path.

Do you find -wholename to be more readable? It's not an option I've used
much, so I need to look up the man page anyway, but -path is easier to
look up because you do not get redirected to another option like you do
with -wholename.
