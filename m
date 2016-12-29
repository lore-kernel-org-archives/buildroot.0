From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 29 Dec 2016 10:50:59 +0000
Subject: [Buildroot] [Bug 9526] Embedded NPM fails to start with "no such
 file or directory" error
In-Reply-To: <bug-9526-163@https.bugs.busybox.net/>
References: <bug-9526-163@https.bugs.busybox.net/>
Message-ID: <bug-9526-163-i8GsjCFwQv@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9526

--- Comment #1 from bilge at scriptfusion.com ---
For completeness, here is the relevant portion of the log.

$ docker run --rm "$PRODUCT" npm

panic: standard_init_linux.go:175: exec user process caused "no such file or
directory" [recovered]

        panic: standard_init_linux.go:175: exec user process caused "no such
file or directory"

goroutine 1 [running, locked to thread]:

panic(0x7ddea0, 0xc820120b60)

        /usr/local/go/src/runtime/panic.go:481 +0x3e6

github.com/urfave/cli.HandleAction.func1(0xc8200f32e8)

       
/go/src/github.com/opencontainers/runc/Godeps/_workspace/src/github.com/urfave/cli/app.go:478
+0x38e

panic(0x7ddea0, 0xc820120b60)

        /usr/local/go/src/runtime/panic.go:443 +0x4e9

github.com/opencontainers/runc/libcontainer.(*LinuxFactory).StartInitialization.func1(0xc8200f2bf8,
0xc82001a088, 0xc8200f2d08)

       
/go/src/github.com/opencontainers/runc/Godeps/_workspace/src/github.com/opencontainers/runc/libcontainer/factory_linux.go:259
+0x136

github.com/opencontainers/runc/libcontainer.(*LinuxFactory).StartInitialization(0xc820058820,
0x7f969f965470, 0xc820120b60)

       
/go/src/github.com/opencontainers/runc/Godeps/_workspace/src/github.com/opencontainers/runc/libcontainer/factory_linux.go:277
+0x5b1

main.glob.func8(0xc820076780, 0x0, 0x0)

        /go/src/github.com/opencontainers/runc/main_unix.go:26 +0x68

reflect.Value.call(0x7448a0, 0x8f0bd0, 0x13, 0x839998, 0x4, 0xc8200f3268, 0x1,
0x1, 0x0, 0x0, ...)

        /usr/local/go/src/reflect/value.go:435 +0x120d

reflect.Value.Call(0x7448a0, 0x8f0bd0, 0x13, 0xc8200f3268, 0x1, 0x1, 0x0, 0x0,
0x0)

        /usr/local/go/src/reflect/value.go:303 +0xb1

github.com/urfave/cli.HandleAction(0x7448a0, 0x8f0bd0, 0xc820076780, 0x0, 0x0)

       
/go/src/github.com/opencontainers/runc/Godeps/_workspace/src/github.com/urfave/cli/app.go:487
+0x2ee

github.com/urfave/cli.Command.Run(0x83c828, 0x4, 0x0, 0x0, 0x0, 0x0, 0x0,
0x8d0180, 0x51, 0x0, ...)

       
/go/src/github.com/opencontainers/runc/Godeps/_workspace/src/github.com/urfave/cli/command.go:191
+0xfec

github.com/urfave/cli.(*App).Run(0xc820001680, 0xc82000a100, 0x2, 0x2, 0x0,
0x0)

       
/go/src/github.com/opencontainers/runc/Godeps/_workspace/src/github.com/urfave/cli/app.go:240
+0xaa4

main.main()

        /go/src/github.com/opencontainers/runc/main.go:137 +0xe24

The command "docker run --rm "$PRODUCT" npm" exited with 2.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
